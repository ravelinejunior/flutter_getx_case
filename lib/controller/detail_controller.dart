import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void favCounter() {
    if (fav.value.isEven) {
      Get.snackbar("Love you", "Its Even");
      fav.value++;
    } else {
      fav.value++;
      Get.snackbar("Love you", "Its Odd");
    }
  }
}
