import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constansts/color_manager.dart';
import '../../../../data/models/ad_model.dart';
import '../../viewmodel/my_ads_provider.dart';

Widget statusTabs(WidgetRef ref, AdStatus? selected) {
  final tabs = {
    'All': null,
    'Active': AdStatus.active,
    'Pause': AdStatus.pause,
    'Pending': AdStatus.pending,
    'Rejected': AdStatus.rejected,
    'Ended': AdStatus.ended,
  };

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,

    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Row(
      children: tabs.entries.map((e) {
        final isActive = selected == e.value;
        return Padding(
          padding: const EdgeInsets.only(right: 8),

          child: ChoiceChip(
            backgroundColor: ColorManager.white,
            selectedColor: ColorManager.black10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
              side: BorderSide(
                color: isActive ? ColorManager.black12 : Colors.grey,
                width: 0.3,
              ),
            ),
            label: Text(e.key),
            selected: isActive,
            onSelected: (_) =>
                ref.read(selectedStatusProvider.notifier).state = e.value,
          ),
        );
      }).toList(),
    ),
  );
}
