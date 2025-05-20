import 'package:get/get.dart';

import 'cart_screen_controller.dart';

class TotalPriceCalculatorController extends GetxController {
  String calculateTotalPrice() {
    double totalPrice = 0.0;

    for (int i = 0;
        i < Get.find<CartScreenController>().cartItems.length;
        i++) {
      totalPrice +=
          double.parse(Get.find<CartScreenController>().cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
