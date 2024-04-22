import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserInterestController extends GetxController {
  List<String> categories = [
    'Bags',
    'Shoes',
    'Food',
    'Watches',
    'Video Games',
    'Books',
    'Games',
    'Home Accessories'
  ];

  RxSet<String> selectedCategories = <String>{}.obs; // Change to RxSet

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    update(); // Trigger UI update
  }
}
