
import 'package:flutter_riverpod/legacy.dart';

final selectedGridProvider = StateProvider<int>((ref) => -1);
final selectedSubProvider = StateProvider<int>((ref) => -1);
final selectedCategoryNameProvider = StateProvider<String>((ref) => '');

