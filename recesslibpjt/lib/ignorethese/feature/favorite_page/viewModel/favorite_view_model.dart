import 'package:flutter/material.dart';
import 'package:recesslibpjt/ignorethese/feature/favorite_page/model/favorite_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  late final List<FavoriteModel> _items = FavoriteItems().items;
  List<FavoriteModel> get favoriModel => _items;

  favoriToList(FavoriteModel favoriModel) {
    _items.contains(favoriModel);
    notifyListeners();
  }
}
