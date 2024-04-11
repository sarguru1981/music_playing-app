import 'package:flutter/material.dart';
import 'package:music_app/features/presentation/home/widgets/playlist_card.dart';
import 'package:music_app/features/presentation/home/widgets/section_header.dart';
import 'package:music_app/themes/app_style.dart';
import 'package:music_app/util/dimen.dart';
import 'package:music_app/widgets/custom_drawer.dart';

import 'package:music_app/features/model/song_model.dart';

class _Constants {
  static const String profileImage = 'https://images.unsplash.com/photo-1659025435463-a039676b45a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Song> allSongs;
  late List<Song> filteredSongs;

  @override
  void initState() {
    super.initState();
    allSongs = Song.songs;
    filteredSongs = allSongs;
  }

  void _filterSongs(String query) {
    setState(() {
      filteredSongs = allSongs.where((song) {
        return song.title.toLowerCase().contains(query.toLowerCase()) ||
            song.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.orange.shade800.withOpacity(Dimensions.dimen_0_dot_8),
            Colors.orange.shade200.withOpacity(Dimensions.dimen_0_dot_8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _DiscoverMusic(onSearch: _filterSongs),
              _PlaylistMusic(songs: filteredSongs),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  final Function(String) onSearch;

  const _DiscoverMusic({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.dimen20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: AppTextStyles.homeWelcomeTextStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: Dimensions.dimen5),
          Text(
            'Enjoy your favorite music',
            style: AppTextStyles.headerStyle,
          ),
          const SizedBox(height: Dimensions.dimen20),
          TextFormField(
            onChanged: onSearch,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: AppTextStyles.searchTextStyle
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.dimen15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaylistMusic extends StatelessWidget {
  const _PlaylistMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: 'Playlists'),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: songs.length,
            itemBuilder: ((context, index) {
              return PlaylistCard(song: songs[index]);
            }),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.grid_view_rounded, color: Colors.white),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: Dimensions.dimen20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              _Constants.profileImage,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Dimensions.dimen56);
}