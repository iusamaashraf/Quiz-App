import 'package:get/get.dart';
import 'package:quiz_app/panels/admin/models/category_model.dart';

class CategoryController extends GetxController {
  // RxString? addCategory;

  //Creating list of cateogry
  Rx<List<Category>> categorylist = Rx<List<Category>>([]);
  List<Category> get categoryupdatedlist => categorylist.value;

  void updateCategory(String categoryName) {
    categoryupdatedlist.add(Category(cateogry: categoryName));
    update();
    print(categoryupdatedlist.length);
  }
}
