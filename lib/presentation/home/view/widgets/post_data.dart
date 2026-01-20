
import 'package:flutter_application_5/data/models/post_model.dart';

import '../../../../core/constansts/image_manager.dart';

final List<PostModel> allPosts = [
  PostModel(
    image: ImageManager.img1,
    type: 'For Sale',
    title: 'Vintage Leather Sofa',
    location: 'San Francisco, CA',
    time: '6h ago',
    price: '\$800',
  ),
  PostModel(
    image: ImageManager.img2,
    type: 'Services',
    title: 'Eyelash Extensions',
    location: 'San Antonio, TX',
    time: '3h ago',
    price: '\$60',
  ),
  PostModel(
    image: ImageManager.img3,
    type: 'Job',
    title: 'Developer (React/Next.js)',
    location: 'New York, NY',
    time: '4h ago',
    price: '\$1400',
  ),
  PostModel(
    image: ImageManager.img4,
    type: 'Job',
    title: 'Developer (React/Next.js)',
    location: 'New York, NY',
    time: '4h ago',
    price: '\$1400',
  ),
  PostModel(
    image: ImageManager.img5,
    type: 'Job',
    title: 'Developer (React/Next.js)',
    location: 'New York, NY',
    time: '4h ago',
    price: '\$1400',
  ),
];
