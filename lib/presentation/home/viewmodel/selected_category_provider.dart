import 'package:flutter_riverpod/legacy.dart';

final selectedCategoryProvider = StateProvider.autoDispose<int>((ref) => -1);
final selectedListItemProvider = StateProvider.autoDispose<int>((ref) => -1);
