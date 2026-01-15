class FilterState {
  final double minPrice;
  final double maxPrice;
  final double distance;
  final String category;
  final String subCategory;

  FilterState({
    this.minPrice = 100,
    this.maxPrice = 1000,
    this.distance = 25,
    this.category = 'Services',
    this.subCategory = 'Automotive Services',
  });

  // Helper to update specific fields
  FilterState copyWith({
    double? minPrice,
    double? maxPrice,
    double? distance,
    String? category,
    String? subCategory,
  }) {
    return FilterState(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      distance: distance ?? this.distance,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
    );
  }
}