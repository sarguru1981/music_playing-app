import 'package:flutter/cupertino.dart';
import 'package:music_app/features/data/user_wishlist_repository.dart';

class UserWishListProvider extends ChangeNotifier {
  final UserWishListRepository _userWishListRepository;

  UserWishListProvider({UserWishListRepository? repository})
      : _userWishListRepository = repository ?? UserWishListRepository();

  List<int> _userWishList = [];

  List<int> get userWishList => _userWishList;

  set userWishList(List<int> value) {
    _userWishList = value;
    notifyListeners();
  }

  Future<void> addToWishList(String userId, int songId) async {
    try {
      await fetchWishList(userId);

      if (_userWishList.contains(songId)) {
        _userWishList.remove(songId);
      } else {
        _userWishList.add(songId);
      }

      await _userWishListRepository.write(userId: userId, data: _userWishList);

      notifyListeners();
    } catch (e) {
      print('Error adding/removing song to/from wish list: $e');
    }
  }

  Future<void> fetchWishList(String userId) async {
    try {
      _userWishList = await _userWishListRepository.read(userId: userId);
      notifyListeners();
    } catch (e) {
      print('Error fetching wish list: $e');
    }
  }
}
