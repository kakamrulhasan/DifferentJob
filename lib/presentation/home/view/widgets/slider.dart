import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/slider_provider.dart';

class slider extends ConsumerWidget {
  const slider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderValue = ref.watch(sliderProvider);

    return Slider(
      value: sliderValue,
      max: 100,
      divisions: 5,
      label: '${sliderValue.round()}km',
      onChanged: (double value) {
        // Update the value in Riverpod
        ref.read(sliderProvider.notifier).state = value;
      },
    );
  }
}
