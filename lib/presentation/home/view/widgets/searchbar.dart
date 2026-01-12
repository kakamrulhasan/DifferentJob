import 'package:flutter/material.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/custom_dropdown_button.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/price_range.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/search_bar_widget.dart';
import 'package:flutter_application_5/presentation/home/view/widgets/slider.dart';
import 'package:flutter_application_5/presentation/home/viewmodel/riverpod/dropdown_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constansts/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../widgets/primary_button.dart';
import '../../viewmodel/riverpod/slider_provider.dart';

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
    required this.searchController,
    required this.category,
    required this.subCategory,
  });

  final TextEditingController searchController;
  final List<String> category;
  final List<String> subCategory;

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(
      controller: searchController,
      onFilterPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: ColorManager.backgroundColor,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(
                          color: ColorManager.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const FaIcon(
                          FontAwesomeIcons.multiply,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1),
                  const SizedBox(height: 10),

                  // Price Range
                  Text(
                    'Price Range',
                    style: TextStyle(
                      color: ColorManager.black54,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const priceRange(),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 0.9),
                  const SizedBox(height: 10),

                  // Distance Slider
                  Consumer(
                    builder: (context, ref, _) {
                      final distance = ref.watch(sliderProvider);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Distance',
                                style: TextStyle(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_on),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${distance.round()} km',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const slider(),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 0.9),
                  const SizedBox(height: 10),

                  // Category Dropdown
                  const Text('Select Category'),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    items: category,
                    provider: selectedCategoryProvider,
                    hint: 'Select a category',
                  ),
                  const SizedBox(height: 20),

                  // Subcategory Dropdown
                  const Text('Select Subcategory'),
                  const SizedBox(height: 10),
                  CustomDropdown<String>(
                    items: subCategory,
                    provider: selectedSubCategoryProvider,
                    hint: 'Select a subcategory',
                    dropdownColor: Colors.purple.shade50,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Clear All',
                          onPressed: () {},
                          type: ButtonType.outlined,
                          borderColor: ColorManager.black12,
                          textColor: ColorManager.black54,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                          text: 'Apply Filter',
                          onPressed: () {},
                          type: ButtonType.filled,
                          borderColor: ColorManager.primary,
                          textColor: ColorManager.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
