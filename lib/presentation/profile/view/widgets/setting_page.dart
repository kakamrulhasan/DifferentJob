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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 16,
                      right: 16,
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
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const Icon(
                          Icons.person_add_alt_1_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: -45,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.backgroundColor,
                        width: 4,
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
                ),
              ],
            ),

            const SizedBox(height: 55),

            const Text(
              'John Doe',
              style: TextStyle(
                color: ColorManager.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Austin, TX',
              style: TextStyle(color: ColorManager.black54),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _settingsCard(Icons.settings_outlined, 'General Settings'),
                  _settingsCard(
                    Icons.notifications_none,
                    'Notifications Settings',
                  ),
                  _settingsCard(Icons.person_outline, 'Accounts Settings'),
                  _settingsCard(
                    Icons.explore_outlined,
                    'Location GPS',
                    trailing: Switch(
                      value: true,
                      onChanged: (v) {},
                      activeColor: ColorManager.primary,
                    ),
                  ),
                  _settingsCard(Icons.shield_outlined, 'Security Settings'),
                  _settingsCard(Icons.lock_outline, 'Privacy Policy'),
                  _settingsCard(Icons.sell_outlined, 'About Local'),
                  _settingsCard(
                    Icons.logout,
                    'Log Out',
                    textColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: 4, // "Profile" selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'My Ad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Message',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _settingsCard(
    IconData icon,
    String title, {
    Widget? trailing,
    Color? textColor,
    Color? iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.grey[600]),
        title: Text(
          title,
          style: TextStyle(
            color: textColor ?? ColorManager.black,
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
