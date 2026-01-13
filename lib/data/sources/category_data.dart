import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category_model.dart' show CategoryModel;

final categoriesProvider = Provider<List<CategoryModel>>(
  (ref) => [
    CategoryModel(id: 1, title: 'Services', icon: Icons.build),
    CategoryModel(id: 2, title: 'Job', icon: Icons.work),
    CategoryModel(id: 3, title: 'For Sale', icon: Icons.sell),
    CategoryModel(id: 4, title: 'Gigs', icon: Icons.assignment),
    CategoryModel(id: 5, title: 'Help', icon: Icons.headset_mic),
    CategoryModel(id: 6, title: 'Community', icon: Icons.groups),
  ],
);
