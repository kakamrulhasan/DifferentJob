import 'package:flutter_application_5/core/constansts/image_manager.dart';
import 'package:flutter_application_5/data/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class PostNotifier extends Notifier<List<PostModel>> {
  @override
  List<PostModel> build() {
    return _getData();
  }

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
      PostModel(
        image: ImageManager.img2,
        type: 'Services',
        title: 'Eyelash Extensions',
        location: 'California',
        time: '3h ago',
        price: '\$60',
      ),
      PostModel(
        image: ImageManager.img3,
        type: 'Job',
        title: 'Developer (React/Next.js)',
        location: 'California',
        time: '4h ago',
        price: '\$1400',
      ),
      PostModel(
        image: ImageManager.img4,
        type: 'Gigs',
        title: 'Graphic Designer fo Logo',
        location: 'California',
        time: '1h ago',
        price: '\$150',
      ),
      PostModel(
        image: ImageManager.img5,
        type: 'Help',
        title: 'Need Moving Assistance',
        location: 'California',
        time: '1h ago',
        price: '\$120',
      ),
    ];
  }
}

final postProvider = NotifierProvider<PostNotifier, List<PostModel>>(
  PostNotifier.new,
);

final profileTabProvider = StateProvider<int>((ref) => 0);