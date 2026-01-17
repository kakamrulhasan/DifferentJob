
import 'package:flutter_riverpod/legacy.dart';

import '../../../../data/models/filter_model.dart';

class FilterViewModel extends StateNotifier<FilterState> {
  FilterViewModel() : super(FilterState());

  void updateMinPrice(double value) => state = state.copyWith(minPrice: value);
  void updateMaxPrice(double value) => state = state.copyWith(maxPrice: value);
  void updateDistance(double value) => state = state.copyWith(distance: value);
  void updateCategory(String value) => state = state.copyWith(category: value);
  void updateSubCategory(String value) => state = state.copyWith(subCategory: value);

  void clearAll() {
    state = FilterState(); // Reset to defaults
  }
}

final filterProvider = StateNotifierProvider<FilterViewModel, FilterState>((ref) {
  return FilterViewModel();
});