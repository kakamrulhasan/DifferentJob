import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateProvider.autoDispose<String>((ref) => '');