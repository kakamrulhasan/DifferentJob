import 'package:flutter/widgets.dart';

class ItemDetail {
  final String title;
  final String description;
  final String price;
  final String image;
  ItemDetail({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}
class GridCategory {
  final String title;
  final IconData icon;

  GridCategory({required this.title, required this.icon});
}