import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/post/viewmodel/selected_category_provider.dart';
import '../sources/services_data.dart';

final categoryListProvider = Provider<List<String>>((ref) {
  final selectedCategoryId = ref.watch(selectedCategoryProvider);

  switch (selectedCategoryId) {
    case 1:
      return ref.watch(fruitProvider);
    case 2:
      return ref.watch(jobProvider);
    case 3:
      return ref.watch(forSaleProvider);
    default:
      return [];
  }
});
