import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/home_tab_item.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/searchbar.dart';
import 'package:flutter_application_5/presentation/home/viewmodel/selected_category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/sources/category_data.dart';
import '../../../data/sources/post_data.dart';
import '../../widgets/search_bar_widget.dart';
import '../viewmodel/home_tab_provider.dart';
import '../../widgets/post_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final Map<int, List<String>> categoryWiseItems = {
    0: ['Automotive Services','Beauty','Pet Services','Skilled Trade Services','Small Business Ads','Labor, Hauling & Moving','Household Services'], // Services
    1: ['Accounting/Finance','Design/Development','Landingscaping/Groundskeeping','Construction','Demolition','Mover/Moving','Junk Removal Specialist','Hauling Services','Yard Cleaning/Brush Cleaning','Fence Installation/Repair'], // Job
    2: ['Antiques','Arts & Crafts','Books & Magazines','Furniture','Auto Parts','Auto Wheels & Tires','Aviation','Baby & Kid stuff'], // For Sale
    3: ['Delivery Help', 'Event Support'], // Gigs
    4: ['Need Tutor', 'Need Cleaner'], // Help
    5: ['Community Meetup', 'Volunteer Work'], // Community
  };

  @override
  Widget build(BuildContext context) {
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
                      final selectedCategoryIndex = ref.watch(
                        selectedCategoryProvider,
                      );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Browser by Category',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

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
                              final isSelected = selectedCategoryIndex == index;

                              return GestureDetector(
                                onTap: () {
                                  ref
                                          .read(
                                            selectedCategoryProvider.notifier,
                                          )
                                          .state =
                                      index;
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
                                        categories[index].icon,
                                        color: isSelected
                                            ? ColorManager.primary
                                            : ColorManager.black54,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(categories[index].title),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 24),
                          const Text(
                            'All Categories',
                            style: TextStyle(
                              color: ColorManager.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (selectedCategoryIndex != -1 &&
                              categoryWiseItems.containsKey(
                                selectedCategoryIndex,
                              ))
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  categoryWiseItems[selectedCategoryIndex]!
                                      .length,
                              itemBuilder: (context, index) {
                                final item =
                                    categoryWiseItems[selectedCategoryIndex]![index];
                                final selectedIndex = ref.watch(
                                  selectedListItemProvider,
                                );
                                final isSelected = selectedIndex == index;

                                return InkWell(
                                  onTap: () {
                                    ref
                                            .read(
                                              selectedListItemProvider.notifier,
                                            )
                                            .state =
                                        index;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: isSelected
                                            ? ColorManager.primary
                                            : ColorManager.black12,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(title: Text(item)),
                                  ),
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
                    }

                    return const SizedBox.shrink();
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
