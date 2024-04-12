import 'package:flutter/material.dart';
import 'package:music_app/features/data/authentication_repository.dart';
import 'package:music_app/features/model/song_model.dart';
import 'package:music_app/features/presentation/home/provider/favorite_notifier.dart';
import 'package:music_app/themes/app_style.dart';
import 'package:music_app/util/dimen.dart';

class PlaylistCard extends StatefulWidget {
  const PlaylistCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  State<PlaylistCard> createState() => _PlaylistCardState();
}

class _PlaylistCardState extends State<PlaylistCard> {
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
    return InkWell(
      onTap: () async {
        final updatedUserWishList = await Navigator.pushNamed(context, '/playlist', arguments: widget.song);
        setState(() {
          userWishListProvider.userWishList = updatedUserWishList as List<int>;
        });
      },
      child: Hero(
        tag: 'playlist_image_${widget.song.id}',
        child: Container(
          height: Dimensions.dimen75,
          margin: const EdgeInsets.only(bottom: Dimensions.dimen10),
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.dimen20),
          decoration: BoxDecoration(
            color: Colors.orange.shade800.withOpacity(Dimensions.dimen_0_dot_6),
            borderRadius: BorderRadius.circular(Dimensions.dimen15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.dimen15),
                child: Image.asset(
                  widget.song.coverUrl,
                  height: Dimensions.dimen50,
                  width: Dimensions.dimen50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: Dimensions.dimen20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.song.title,
                      style: AppTextStyles.songTitleTextStyle.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: Dimensions.dimen10,),
                    Text(
                      widget.song.description,
                      maxLines: 2,
                      style: AppTextStyles.songDescTextStyle.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () async{
                  final songId = widget.song.id;
                  await userWishListProvider.addToWishList(userId, songId);
                  if (mounted) {
                    setState(() {});
                  }
                },
                icon: Icon(
                  userWishListProvider.userWishList.contains(widget.song.id)
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  color: userWishListProvider.userWishList.contains(widget.song.id)
                      ? Colors.red
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
