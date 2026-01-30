
import 'package:get/get.dart';

class SearchController extends GetxController {
  final searchText = ''.obs;
  
  void updateSearchText(String text) {
    searchText.value = text;
  }
  
  void performSearch() {
    // 实现搜索逻辑
    print('Searching for: ${searchText.value}');
  }
}
