import 'package:flutter/material.dart';
import 'package:music_app/themes/app_style.dart';
import 'package:music_app/util/dimen.dart';
import 'package:music_app/features/model/song_model.dart';

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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final dynamic updatedFavoriteStatus = await Navigator.pushNamed(context, '/playlist', arguments: widget.song);

        if (updatedFavoriteStatus != null && updatedFavoriteStatus is bool) {
          setState(() {
            widget.song.isFavorite = updatedFavoriteStatus;
          });
        }
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
              onPressed: () {
                // Toggling the favorite status
                setState(() {
                  widget.song.isFavorite = !widget.song.isFavorite;
                });
              },
              icon: Icon(
                widget.song.isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: widget.song.isFavorite ? Colors.red : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
