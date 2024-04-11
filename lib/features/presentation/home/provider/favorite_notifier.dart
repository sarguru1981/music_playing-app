import 'package:flutter/material.dart';
import 'package:music_app/features/model/song_model.dart';

class FavoriteState extends ChangeNotifier {
  List<Song> _favoriteSongs = [];

  List<Song> get favoriteSongs => _favoriteSongs;

  void addFavoriteSong(Song song) {
    _favoriteSongs.add(song);
    notifyListeners();
  }

  void removeFavoriteSong(Song song) {
    _favoriteSongs.remove(song);
    notifyListeners();
  }

  bool isSongFavorite(Song song) {
    return _favoriteSongs.contains(song);
  }
}
