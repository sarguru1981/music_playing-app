import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/presentation/details/widgets/player_buttons.dart';
import 'package:music_app/features/presentation/details/widgets/seekbar.dart';
import 'package:music_app/themes/app_style.dart';
import 'package:music_app/util/dimen.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import 'package:music_app/features/model/song_model.dart';

import 'package:music_app/features/data/authentication_repository.dart';
import 'package:music_app/features/presentation/home/provider/favorite_notifier.dart';

class PlaylistDetailScreen extends StatefulWidget {
  const PlaylistDetailScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  late final Song song;
  final AudioPlayer audioPlayer = AudioPlayer();

  late UserWishListProvider userWishListProvider;
  late AuthenticationRepository authRepository;
  late Future<void> initialization;
  late String userId;

  @override
  void initState() {
    super.initState();
    initialization = _initializeData();
  }

  Future<void> _initializeData() async {
    userWishListProvider = UserWishListProvider();
    authRepository = AuthenticationRepository();
    userId = (await authRepository.currentUserId)!;
    await userWishListProvider.fetchWishList(userId);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    song = ModalRoute.of(context)!.settings.arguments as Song;
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
          Duration position,
          Duration? duration,
          ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        } else {
          return _buildContent();
        }
      },
    );
  }

  Widget _buildContent() {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, userWishListProvider.userWishList);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.orange),
          actions: [
            IconButton(
              onPressed: () async{
                final songId = song.id;
                await userWishListProvider.addToWishList(userId, songId);
                if (mounted) {
                  setState(() {});
                }
              },
              icon: Icon(
                userWishListProvider.userWishList.contains(song.id)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: userWishListProvider.userWishList.contains(song.id)
                    ? Colors.red
                    : Colors.orange,
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              song.coverUrl,
              fit: BoxFit.cover,
            ),
            const _BackgroundFilter(),
            _MusicPlayer(
              song: song,
              seekBarDataStream: _seekBarDataStream,
              audioPlayer: audioPlayer,
            ),
          ],
        ),
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    Key? key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  })  : _seekBarDataStream = seekBarDataStream,
        super(key: key);

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 50.0,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: AppTextStyles.songTitleTextStyle.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            song.description,
            maxLines: 2,
            style: AppTextStyles.songDescTextStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 30),
          StreamBuilder<SeekBarData>(
            stream: _seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChangeEnd: audioPlayer.seek,
              );
            },
          ),
          PlayerButtons(audioPlayer: audioPlayer),
        ],
      ),
    );
  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(Dimensions.dimen_0_dot_5),
                Colors.white.withOpacity(Dimensions.dimen0),
              ],
              stops: const [
                Dimensions.dimen0,
                Dimensions.dimen_0_dot_4,
                Dimensions.dimen_0_dot_6
              ]).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange.shade200,
                Colors.orange.shade800,
              ],
            ),
          ),
        ),
    );
  }
}
