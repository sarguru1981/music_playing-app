import 'package:flutter/material.dart';
import 'package:music_app/themes/app_style.dart';

import 'package:music_app/util/dimen.dart';

import 'package:music_app/features/model/song_model.dart';


class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/playlist', arguments: song);
      },
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
                song.coverUrl,
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
                    song.title,
                    style: AppTextStyles.songTitleTextStyle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: Dimensions.dimen10,),
                  Text(
                    song.description,
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
          ],
        ),
      ),
    );
  }
}