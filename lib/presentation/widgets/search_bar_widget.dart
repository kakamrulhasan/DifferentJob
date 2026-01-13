import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/presentation/home/viewmodel/riverpod/search_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constansts/image_manager.dart';

class CustomSearchBar extends ConsumerWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    this.onFilterPressed,
  });
  final TextEditingController controller;
  final VoidCallback? onFilterPressed;

  @override
  Widget build(BuildContext, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: ColorManager.black10,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 18),
              onChanged: (value) {
                ref.read(searchProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(fontSize: 18),
                prefixIcon: Icon(Icons.search, size: 28),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onFilterPressed,
          icon: Image.asset(ImageManager.filter, height: 60, width: 60),
        ),
      ],
    );
  }
}
