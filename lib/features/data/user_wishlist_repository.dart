import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'cache.dart';

class UserWishListRepository {
  final CacheClient _cache;
  final FirebaseDatabase _firebaseDB;

  UserWishListRepository({
    CacheClient? cache,
    FirebaseDatabase? firebaseDB,
  })
      : _cache = cache ?? CacheClient(),
        _firebaseDB = firebaseDB ??
            FirebaseDatabase.instanceFor(
                app: Firebase.app(),
                databaseURL: 'https://fluttermusicapp-4c1cb-default-rtdb.asia-southeast1.firebasedatabase.app');

  @visibleForTesting
  static const userWishListCacheKey = '__user_wishlist_cache_key__';

  Future<void> write({
    required String userId,
    required List<int> data,
  }) async {
    try {
      String jsonData = jsonEncode(data);

      DatabaseReference _databaseReference =
      _firebaseDB.reference().child("users/$userId");
      await _databaseReference.set(jsonData);
      _cache.set(userWishListCacheKey, jsonData);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<int>> read({required String userId}) async {
    try {
      final dynamic cachedValue = await _cache.get(userWishListCacheKey);
      if (cachedValue != null && cachedValue is String && cachedValue.isNotEmpty) {
        final List<dynamic> parsedData = jsonDecode(cachedValue);
        return parsedData.cast<int>();
      }

      DatabaseReference _databaseReference =
      _firebaseDB.reference().child("users/$userId");
      final snapshot = await _databaseReference.get();
      if (snapshot.exists) {
        final String? jsonData = snapshot.value as String?;
        if (jsonData != null && jsonData.isNotEmpty) {
          final List<dynamic> parsedData = jsonDecode(jsonData);
          return parsedData.cast<int>();
        }
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
