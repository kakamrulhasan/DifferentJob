import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category; 

  const CategoryCard({
    super.key,
    required this.category, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            category.icon, 
            color: ColorManager.primary,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            category.title, 
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
