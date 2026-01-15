import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/post_provider.dart';

Widget tabItem(
  WidgetRef ref,
  String title,
  int index,
  int current,
  Color color,
) {
  bool isActive = index == current;
  return Expanded(
    child: GestureDetector(
      onTap: () => ref.read(profileTabProvider.notifier).state = index,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? color : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Container(height: 3, color: isActive ? color : Colors.transparent),
        ],
      ),
    ),
  );
}
