import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/presentation/post/view/widgets/post_details_screen.dart';
import 'package:flutter_application_5/presentation/post/viewmodel/selected_category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/sources/category_data.dart';

// Your screen
class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryProvider);

    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Post',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Choose what you'd like to post:",
              style: TextStyle(color: ColorManager.black54, fontSize: 20),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category.id == selectedCategoryId;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      color: ColorManager.backgroundColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: isSelected
                              ? ColorManager.primary
                              : ColorManager.black12,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      child: ListTile(
                        leading: Icon(
                          category.icon,
                          color: ColorManager.primary,
                        ),
                        title: Text(category.title),
                        onTap: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              category.id;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryDetailScreen(category: category),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
