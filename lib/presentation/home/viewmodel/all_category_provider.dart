import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/constansts/image_manager.dart';

import '../../../data/models/category_all_services.dart';
final List<GridCategory> gridCategories = [
  GridCategory(title: 'Gigs', icon: Icons.assignment),
  GridCategory(title: 'Jobs', icon: Icons.headset_mic),
  GridCategory(title: 'Help', icon: Icons.groups),
];
final Map<String, List<String>> subCategories = {
  'Gigs': ['Creative Gigs', 'Crew Gigs', 'Event Gigs'],
  'Jobs': ['Full Time', 'Part Time'],
  'Help': ['Moving Help', 'Cleaning Help'],
};

final Map<String, List<ItemDetail>> postsBySubCategory = {
  'Creative Gigs': [
    ItemDetail(
      title: 'Logo Designer Needed',
      description: 'Design a logo',
      price: '\$150',
      image: ImageManager.img1,
    ),
  ],

  'Crew Gigs': [
    ItemDetail(
      title: 'Camera Operator',
      description: 'Event camera crew',
      price: '\$200',
      image: ImageManager.img2,
    ),
    ItemDetail(
      title: 'Lighting Assistant',
      description: 'Stage lighting support',
      price: '\$120',
      image: ImageManager.img3,
    ),
  ],

  'Event Gigs': [
    ItemDetail(
      title: 'Event Setup Helper',
      description: 'Stage & chairs setup',
      price: '\$80',
      image: ImageManager.img4,
    ),
  ],
};
