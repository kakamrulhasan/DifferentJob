
import 'package:flutter_riverpod/legacy.dart';

final sliderProvider = StateProvider.autoDispose<double>((ref) {
  return 20; 
});