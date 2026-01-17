import 'package:flutter_riverpod/legacy.dart';

final selectedCategoryProvider = StateProvider<int>((ref) => -1);
final selectedListItemProvider = StateProvider<int>((ref) => -1);
