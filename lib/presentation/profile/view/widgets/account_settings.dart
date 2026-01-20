import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';
import '../../viewmodel/account_settings_provider.dart';

class AccountsSettings extends ConsumerWidget {
  const AccountsSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPrivateAccount = ref.watch(privateAccountProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Accounts Settings',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Private Account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF374151),
                    ),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      activeColor: ColorManager.primary,
                      value: isPrivateAccount,
                      onChanged: (value) {
                        // 5. Update the provider state
                        ref.read(privateAccountProvider.notifier).state = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Danger Zone",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            _buildDangerTile(
              icon: Icons.person_off_outlined,
              title: "Disable Account",
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _buildDangerTile(
              icon: Icons.delete_outline,
              title: "Delete Account",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDangerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withOpacity(0.15)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: 24),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
