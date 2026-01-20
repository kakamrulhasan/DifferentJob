import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/presentation/widgets/search_bar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/my_ads_provider.dart';
import 'widgets/ad_card.dart';
import 'widgets/status_tab_widgets.dart';

class MyAdsScreen extends ConsumerWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ads = ref.watch(filteredAdsProvider);
    final selected = ref.watch(selectedStatusProvider);
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ad',
                style: TextStyle(
                  color: ColorManager.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30),
              CustomSearchBar(controller: searchController),
              statusTabs(ref, selected),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: ads.length,
                  itemBuilder: (context, index) => AdCard(ad: ads[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

