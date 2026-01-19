import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/home_tab_item.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/searchbar.dart';
import 'package:flutter_application_5/presentation/home/viewmodel/home_tab_provider.dart';
import '../../../data/sources/post_data.dart';
import '../../widgets/post_card.dart';
import '../../widgets/search_bar_widget.dart';
import '../viewmodel/all_category_provider.dart';
import '../viewmodel/categories_provider.dart';
import 'widgets/home_sublist.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final gridIndex = ref.watch(selectedGridProvider);
    final selectedGrid = gridIndex == -1 ? null : gridCategories[gridIndex];
    final subList = selectedGrid == null
        ? []
        : subCategories[selectedGrid.title]!;

    final searchController = TextEditingController();
    final selectedTab = ref.watch(homeTabProvider);

    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Logo + notification
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
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
            ),

            // Search Bar
            CustomSearchBar(
              controller: searchController,
              onFilterPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const FilterBottomSheet(),
                );
              },
            ),

            // Tabs
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

            // Body
            Expanded(
              child: selectedTab == 0
                  ? ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: allPosts.length,
                      itemBuilder: (context, index) {
                        return PostCard(post: allPosts[index]);
                      },
                    )
                  : selectedTab == 1
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text(
                            'Browse by Category',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Grid Categories
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: gridCategories.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 14,
                                  crossAxisSpacing: 14,
                                ),
                            itemBuilder: (context, index) {
                              final isSelected = gridIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  ref
                                      .read(
                                        selectedCategoryNameProvider.notifier,
                                      )
                                      .state = gridCategories[index]
                                      .title;
                                  ref
                                      .read(selectedGridProvider.notifier)
                                      .state = isSelected
                                      ? -1
                                      : index;
                                  ref.read(selectedSubProvider.notifier).state =
                                      -1;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: isSelected
                                          ? ColorManager.primary
                                          : Colors.grey,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        gridCategories[index].icon,
                                        color: isSelected
                                            ? ColorManager.primary
                                            : ColorManager.black54,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(gridCategories[index].title),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 24),
                          if (gridIndex != -1) ...[
                            Text(
                              'All ${selectedGrid!.title}',
                              style: const TextStyle(
                                color: ColorManager.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],

                          const SizedBox(height: 10),

                          // Subcategories List
                          if (gridIndex != -1)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: subList.length,
                              itemBuilder: (context, index) {
                                final selectedIndex = ref.watch(
                                  selectedSubProvider,
                                );
                                final isSelected = selectedIndex == index;

                                return InkWell(
                                  onTap: () {
                                    ref
                                            .read(selectedSubProvider.notifier)
                                            .state =
                                        index;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HomeSublist(
                                          subCategory: subList[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: isSelected
                                            ? ColorManager.primary
                                            : ColorManager.black12,
                                        width: 1,
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    child: ListTile(
                                      title: Text(subList[index]),
                                    ),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: allPosts.length,
                      itemBuilder: (context, index) {
                        return PostCard(post: allPosts[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
