import 'package:flutter/material.dart';
import '../models/attraction.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Attraction> _favoriteAttractions = [];

  List<Attraction> get favoriteAttractions => List.unmodifiable(_favoriteAttractions);

  bool isFavorite(Attraction attraction) {
    return _favoriteAttractions.any(
      (item) => item.title == attraction.title && item.location == attraction.location,
    );
  }

  void toggleFavorite(Attraction attraction) {
    if (isFavorite(attraction)) {
      _favoriteAttractions.removeWhere(
        (item) => item.title == attraction.title && item.location == attraction.location,
      );
    } else {
      _favoriteAttractions.add(attraction);
    }
    notifyListeners();
  }

  void addFavorite(Attraction attraction) {
    if (!isFavorite(attraction)) {
      _favoriteAttractions.add(attraction);
      notifyListeners();
    }
  }

  void removeFavorite(Attraction attraction) {
    if (isFavorite(attraction)) {
      _favoriteAttractions.removeWhere(
        (item) => item.title == attraction.title && item.location == attraction.location,
      );
      notifyListeners();
    }
  }
}
