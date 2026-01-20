import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutItem {
  final String title;
  final String description;

  AboutItem({required this.title, required this.description});
}

final aboutLocalProvider = Provider<List<AboutItem>>((ref) {
  return [
    AboutItem(
      title: "Welcome to Local",
      description: "Local is a place where local communities come together to offer services, find jobs, sell goods, and more. We believe in fostering strong community ties and helping each other succeed.",
    ),
    AboutItem(
      title: "What We Do",
      description: "Local is a community-powered platform that helps people find, offer, and request services, jobs, and items all within their neighborhood. Whether you're looking for a graphic designer, selling furniture, or offering handyman services, Local makes it easy to connect.",
    ),
    AboutItem(
      title: "Why Local?",
      description: "Because local matters. Unlike other platforms, Local focuses on what's nearby so you can discover real people, trusted services, and quick help without scrolling endlessly through irrelevant posts. No fees, no noise just useful local connections.",
    ),
  ];
});