import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/presentation/home/view/home_screen.dart';
import 'package:flutter_application_5/presentation/messanger/view/message_screen.dart';
import 'package:flutter_application_5/presentation/profile/view/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../my_ads/view/my_ad_screen.dart';
import '../../post/view/screen/post_screen.dart';
import '../viewmodel/bottom_nav_provider.dart';

class BottomNavPage extends ConsumerWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavProvider);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeScreen(),
          MyAdsScreen(),
          PostScreen(),
          MessageScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorManager.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: ColorManager.black12,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,

          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.black54,
          backgroundColor: ColorManager.backgroundColor,
          onTap: (index) {
            ref.read(bottomNavProvider.notifier).state = index;
          },

          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageManager.home)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageManager.myads)),
              label: 'My Ad',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageManager.post)),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageManager.message)),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(ImageManager.user)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
