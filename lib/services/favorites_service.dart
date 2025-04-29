import 'package:flutter/material.dart';
import 'package:guitar_codes_app/models/favorite.dart';

class FavoritesService with ChangeNotifier {
  final List<Favorite> _favorites = [];

  List<Favorite> get favorites => _favorites;

  void addFavorite(Favorite favorite) {
    if (!isFavorite(favorite)) {
      _favorites.add(favorite);
      notifyListeners();
    }
  }

  void removeFavorite(Favorite favorite) {
    _favorites.remove(favorite);
    notifyListeners();
  }

  bool isFavorite(Favorite favorite) {
    return _favorites.contains(favorite);
  }
}
