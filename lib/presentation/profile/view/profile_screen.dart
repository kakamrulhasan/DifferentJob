import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constansts/color_manager.dart';
import '../../widgets/post_card.dart';
import '../viewmodel/post_provider.dart';
import 'widgets/info_view.dart';
import 'widgets/tab_bar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postProvider);
    final selectedTab = ref.watch(profileTabProvider);
    final primaryPurple = ColorManager.primary;
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Container(
              height: 180,
              width: double.infinity,
              color: ColorManager.primary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
            child: Column(
              children: [
                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.person_add_alt_1_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.settings_outlined, color: Colors.white),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// AVATAR
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorManager.backgroundColor,
                      width: 1,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://i.pravatar.cc/300?img=12',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'John Doe',
                  style: TextStyle(
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'Austine, Tx',
                  style: TextStyle(color: ColorManager.black54),
                ),

                const SizedBox(height: 20),

                /// CUSTOM TABS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      tabItem(ref, "Post", 0, selectedTab, primaryPurple),
                      tabItem(ref, "Info", 1, selectedTab, primaryPurple),
                    ],
                  ),
                ),

                const Divider(height: 1),

                /// TAB CONTENT
                Expanded(
                  child: selectedTab == 0
                      ? ListView.builder(
                          padding: const EdgeInsets.all(15),
                          itemCount: posts.length,
                          itemBuilder: (context, index) =>
                              PostCard(post: posts[index]),
                        )
                      : const InfoView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
