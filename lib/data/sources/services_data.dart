import 'package:flutter_riverpod/flutter_riverpod.dart';

final fruitProvider = Provider<List<String>>((ref) {
  return ['Orange', 'Apple', 'Banana'];
});

final jobProvider = Provider<List<String>>((ref) {
  return ['Software Developer', 'Designer', 'Manager'];
});

final forSaleProvider = Provider<List<String>>((ref) {
  return ['Laptop', 'Bike', 'Chair'];
});
