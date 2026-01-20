import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrivacyPolicyItem {
  final String title;
  final String description;

  PrivacyPolicyItem({required this.title, required this.description});
}

// Provider for the privacy policy content
final privacyPolicyProvider = Provider<List<PrivacyPolicyItem>>((ref) {
  return [
    PrivacyPolicyItem(
      title: "Data Collection",
      description: "We collect basic user information like name, email, and profile image to enhance your experience.",
    ),
    PrivacyPolicyItem(
      title: "Data Usage",
      description: "Your data is used for service personalization, communication, and security verification.",
    ),
    PrivacyPolicyItem(
      title: "Data Sharing",
      description: "We do not share your personal information with third parties without your consent.",
    ),
    PrivacyPolicyItem(
      title: "Security",
      description: "We use encryption and secure storage to protect your data.",
    ),
    PrivacyPolicyItem(
      title: "User Rights",
      description: "You can request data deletion or modification anytime through your account settings.",
    ),
  ];
});