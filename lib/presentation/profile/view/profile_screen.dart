import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constansts/color_manager.dart';
import '../../../core/routes/route_name.dart';
import '../../widgets/post_card.dart';
import '../viewmodel/edit_model_provider.dart';
import '../viewmodel/post_provider.dart';
import 'widgets/info_view.dart';
import 'widgets/tab_bar.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(profileEditModeProvider);
    final posts = ref.watch(postProvider);
    final selectedTab = ref.watch(profileTabProvider);
    final primaryPurple = ColorManager.primary;

    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
          ),

          Positioned(
            top: 135,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorManager.white, width: 2),
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
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Profile Edit' : 'Profile',
                      style: const TextStyle(
                        color: ColorManager.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.person_add_alt_1_outlined,
                            color: isEditing
                                ? Colors.transparent
                                : ColorManager.white,
                          ),
                          onPressed: isEditing
                              ? null
                              : () {
                                  ref
                                          .read(
                                            profileEditModeProvider.notifier,
                                          )
                                          .state =
                                      true;
                                },
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.settingsScreen,
                            );
                          },
                          child: const Icon(
                            Icons.settings_outlined,
                            color: ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 130),

                const Text(
                  'John Doe',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                const Text('Austin, TX', style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 20),

                // 🔹 TABS
                Row(
                  children: [
                    Expanded(
                      child: tabItem(
                        ref,
                        "Post",
                        0,
                        selectedTab,
                        primaryPurple,
                      ),
                    ),
                    Expanded(
                      child: tabItem(
                        ref,
                        "Info",
                        1,
                        selectedTab,
                        primaryPurple,
                      ),
                    ),
                  ],
                ),

                const Divider(height: 1),

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

                if (isEditing)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          ref.read(profileEditModeProvider.notifier).state =
                              false;
                        },
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
