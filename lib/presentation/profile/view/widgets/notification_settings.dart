import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/color_manager.dart';

class NotificationsSettings extends StatefulWidget {
  const NotificationsSettings({super.key});

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  final Map<String, bool> _settings = {
    "Push Notifications": true,
    "Email Notifications": false,
    "Job & Service Updates": false,
    "Message Alerts": false,
    "Promotions & Offers": true,
  };

  @override
  Widget build(BuildContext context) {
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
          'Notifications Settings',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: _settings.keys.map((String key) {
          return _buildNotificationTile(key, _settings[key]!);
        }).toList(),
      ),
    );
  }

  Widget _buildNotificationTile(String title, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF374151),
            ),
          ),

          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              activeColor: ColorManager.primary,
              value: value,
              onChanged: (bool newValue) {
                setState(() {
                  _settings[title] = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
