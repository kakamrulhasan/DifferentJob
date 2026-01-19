import 'package:flutter_riverpod/legacy.dart';

final profileEditModeProvider = StateProvider<bool>((ref) {
  return false;
});

final profileSettingsModeProvider = StateProvider<bool>((ref){
  return false;
});