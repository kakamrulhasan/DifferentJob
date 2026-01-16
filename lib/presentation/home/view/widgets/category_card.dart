import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/data/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../post/viewmodel/selected_category_provider.dart';

class CategoryCard extends ConsumerWidget {
  final CategoryModel category;
  final bool isSelected ;

  const CategoryCard({super.key, required this.category, required this.isSelected});
  

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final selectedId = ref.watch(selectedCategoryProvider);
    final isActive = selectedId == category.id;
    return InkWell(
      onTap: (){
        ref.read(selectedCategoryProvider.notifier).state = category.id;
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color:  isActive ? ColorManager.primary : Colors.grey.shade300,),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category.icon, color: ColorManager.primary, size: 28),
            const SizedBox(height: 8),
            Text(category.title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
