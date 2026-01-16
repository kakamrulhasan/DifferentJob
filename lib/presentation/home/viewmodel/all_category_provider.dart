import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_5/data/models/category_all_services.dart';
import 'package:riverpod/legacy.dart';

class AllCategoryNotifier
    extends Notifier<List<CategoryAllServices>> {

  @override
  List<CategoryAllServices> build() {
    return _getAllCategory();
  }

  List<CategoryAllServices> _getAllCategory() {
    return [
      CategoryAllServices(type: 'Accounting/Finance'),
      CategoryAllServices(type: 'Landscaping/'),
    ];
  }
}

final allCategoryProvider =
    NotifierProvider<AllCategoryNotifier, List<CategoryAllServices>>(
  AllCategoryNotifier.new,
);

final allCategoriesState = StateProvider<bool>((Ref)=>false);