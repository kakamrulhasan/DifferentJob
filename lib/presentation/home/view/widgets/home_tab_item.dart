import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';

class HomeTabItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const HomeTabItem({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isActive ? ColorManager.primary : ColorManager.black54,
              ),
            ),
            const SizedBox(height: 8),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2.5,
              width: double.infinity,
              color: isActive ? ColorManager.primary : ColorManager.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
