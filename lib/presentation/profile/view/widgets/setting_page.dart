import 'package:flutter/material.dart';

import '../../../../core/constansts/color_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
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
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              return Navigator.pop(context);
                            },
                          ),
                          const Text(
                            'Settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Profile Picture Overlay
                Positioned(
                  bottom: -45,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/300?img=12',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 55),

            /// 2. NAME & LOCATION
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorManager.secondary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Austin, TX',
              style: TextStyle(fontSize: 14, color: ColorManager.secondary),
            ),

            const SizedBox(height: 30),

            /// 3. SETTINGS LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _settingsTile(Icons.settings_outlined, 'General Settings'),
                  _settingsTile(
                    Icons.notifications_none,
                    'Notifications Settings',
                  ),
                  _settingsTile(Icons.person_outline, 'Accounts Settings'),
                  _settingsTile(
                    Icons.explore_outlined,
                    'Location GPS',
                    trailing: Switch(
                      value: true,
                      onChanged: (v) {},
                      activeColor: ColorManager.primary,
                    ),
                  ),
                  _settingsTile(Icons.shield_outlined, 'Security Settings'),
                  _settingsTile(Icons.lock_outline, 'Privacy Policy'),
                  _settingsTile(Icons.style_outlined, 'About Local'),
                  _settingsTile(Icons.logout, 'Log Out', isLogout: true),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Helper widget for the setting cards
  Widget _settingsTile(
    IconData icon,
    String title, {
    Widget? trailing,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : Colors.grey[600]),
        title: Text(
          title,
          style: TextStyle(
            color: isLogout ? Colors.red : ColorManager.secondary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing:
            trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
