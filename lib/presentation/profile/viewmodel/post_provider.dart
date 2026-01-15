import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/data/models/post_model.dart';

List<PostModel> _getData() {
  return [
    PostModel(
      image: ImageManager.img1,
      type: 'Furniture',
      title: 'Services',
      location: 'an Francisco,CA',
      time: '6h ago',
      price: '\$800',
    ),
  ];
}
