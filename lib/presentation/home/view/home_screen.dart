import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/home_tab_item.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/searchbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/sources/category_data.dart';
import '../../../data/sources/post_data.dart';
import '../../../data/sources/services_data.dart';
import '../viewmodel/riverpod/home_tab_provider.dart';
import 'widgets/category_card.dart';
import 'widgets/post_card.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final List<String> category = ['services', 'job', 'for sale'];
  final List<String> subCategory = ['Automotive Services', 'AI tools'];
  final List<String> title = ['All', 'Category', 'Location'];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController searchController = TextEditingController();
    
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 12, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageManager.logo,
                      width: 123,
                      height: 123,
                      color: ColorManager.primary,
                    ),
                    const Icon(Icons.notifications_none_outlined, size: 34),
                  ],
                ),

                searchbar(
                  searchController: searchController,
                  category: category,
                  subCategory: subCategory,
                ),
                SizedBox(height: 30),
                Consumer(
                  builder: (context, ref, _) {
                    final selectedIndex = ref.watch(homeTabProvider);

                    return Column(
                      children: [
                        Row(
                          children: [
                            HomeTabItem(
                              title: 'All',
                              isActive: selectedIndex == 0,
                              onTap: () =>
                                  ref.read(homeTabProvider.notifier).state = 0,
                            ),
                            HomeTabItem(
                              title: 'Category',
                              isActive: selectedIndex == 1,
                              onTap: () =>
                                  ref.read(homeTabProvider.notifier).state = 1,
                            ),
                            HomeTabItem(
                              title: 'Location',
                              isActive: selectedIndex == 2,
                              onTap: () =>
                                  ref.read(homeTabProvider.notifier).state = 2,
                            ),
                          ],
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                ),

                SizedBox(height: 30),
                Text(
                  'Recent Posts',
                  style: TextStyle(
                    color: ColorManager.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),

                Consumer(
                  builder: (context, ref, _) {
                    final selectedIndex = ref.watch(homeTabProvider);

                    if (selectedIndex == 0) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allPosts.length,
                        itemBuilder: (context, index) {
                          return PostCard(post: allPosts[index]);
                        },
                      );
                    } else if (selectedIndex == 1) {
                      final categories = ref.watch(categoriesProvider);
                      final fruitproviders = ref.watch(fruitProvider);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: categories.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 14,
                                  crossAxisSpacing: 14,
                                ),
                            itemBuilder: (context, index) {
                              return CategoryCard(category: categories[index]);
                            },
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            'All Jobs',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: fruitproviders.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(fruitproviders[index]),
                              );
                            },
                          ),
                        ],
                      );
                    } else if (selectedIndex == 2) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allPosts.length,
                        itemBuilder: (context, index) {
                          return PostCard(post: allPosts[index]);
                        },
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
