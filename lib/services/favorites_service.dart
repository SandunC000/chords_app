import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/favorite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService with ChangeNotifier {
  List<Favorite> _favorites = [];

  List<Favorite> get favorites => _favorites;

  FavoritesService() {
    _loadFavorites();
  }

  void addFavorite(Favorite favorite) {
    if (!isFavorite(favorite)) {
      _favorites.add(favorite);
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(Favorite favorite) {
    _favorites.remove(favorite);
    _saveFavorites();
    notifyListeners();
  }

  void clearFavorites() {
    _favorites.clear();
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Favorite favorite) {
    return _favorites.contains(favorite);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final favoritesList = jsonDecode(favoritesJson) as List;
      _favorites =
          favoritesList.map((json) => Favorite.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = jsonEncode(_favorites);
    await prefs.setString('favorites', favoritesJson);
  }
}
