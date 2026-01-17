
import 'package:flutter_riverpod/legacy.dart';

// Selected Category
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

// Selected Subcategory
final selectedSubCategoryProvider = StateProvider.autoDispose<String?>((ref) => null);