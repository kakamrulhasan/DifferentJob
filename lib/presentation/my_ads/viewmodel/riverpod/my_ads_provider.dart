import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

import '../../../../data/models/ad_model.dart';

final selectedStatusProvider =
    StateProvider<AdStatus?>((ref) => null);

final adsProvider = Provider<List<AdModel>>((ref) {
  return [
    AdModel(
      imageUrl:ImageManager.img1,
      category: 'Gigs',
      title: 'Graphic Designer for Logo',
      location: 'Austin, TX',
      price: '\$150',
      postedTime: '1h ago',
      remainingTime: '',
      status: AdStatus.pause,
    ),
    AdModel(
      imageUrl:ImageManager.img2,
      category: 'Service',
      title: 'Hair Styling for Events',
      location: 'Irving, TX',
      price: '\$65',
      postedTime: '4h ago',
      remainingTime: '3:25 hr',
      status: AdStatus.active,
    ),
    AdModel(
      imageUrl:ImageManager.img3,
      category: 'Job',
      title: 'Developer (React/Next.js)',
      location: 'New York, NY',
      price: '\$1400',
      postedTime: '7h ago',
      remainingTime: '',
      status: AdStatus.rejected,
    ),
  ];
});

final filteredAdsProvider = Provider<List<AdModel>>((ref) {
  final ads = ref.watch(adsProvider);
  final status = ref.watch(selectedStatusProvider);

  if (status == null) return ads;
  return ads.where((e) => e.status == status).toList();
});
