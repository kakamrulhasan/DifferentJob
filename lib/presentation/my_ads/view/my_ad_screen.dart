import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/presentation/widgets/search_bar_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/ad_model.dart';
import '../viewmodel/riverpod/my_ads_provider.dart';

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
              _statusTabs(ref, selected),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: ads.length,
                  itemBuilder: (_, i) => _AdCard(ad: ads[i]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusTabs(WidgetRef ref, AdStatus? selected) {
    final tabs = {
      'All': null,
      'Active': AdStatus.active,
      'Pause': AdStatus.pause,
      'Pending': AdStatus.pending,
      'Rejected': AdStatus.rejected,
      'Ended': AdStatus.ended,
    };

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: tabs.entries.map((e) {
          final isActive = selected == e.value;
          return Padding(
            padding: const EdgeInsets.only(right: 8),

            child: ChoiceChip(
              backgroundColor: ColorManager.black10,
              selectedColor: ColorManager.white,
              label: Text(e.key),
              selected: isActive,
              onSelected: (_) =>
                  ref.read(selectedStatusProvider.notifier).state = e.value,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _AdCard extends StatelessWidget {
  final AdModel ad;
  const _AdCard({required this.ad});

  Color _statusColor() {
    switch (ad.status) {
      case AdStatus.active:
        return Colors.green;
      case AdStatus.pause:
        return Colors.orange;
      case AdStatus.pending:
        return Colors.amber;
      case AdStatus.rejected:
        return Colors.red;
      case AdStatus.ended:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                ad.imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ad.category,
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ad.title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(ad.location, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        ad.price,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        ad.postedTime,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _statusColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    ad.status.name.toUpperCase(),
                    style: TextStyle(color: _statusColor(), fontSize: 11),
                  ),
                ),
                if (ad.remainingTime.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    ad.remainingTime,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
