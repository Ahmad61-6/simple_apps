import 'package:get/get.dart';
import 'package:simple_apps/presentation/ui/state_holders/cart_screen_controller.dart';
import 'package:simple_apps/presentation/ui/state_holders/grocery_item_tile_controller.dart';
import 'package:simple_apps/presentation/ui/state_holders/total_price_calculator_controller.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(GroceryItemTileController());
    Get.put(CartScreenController());
    Get.put(TotalPriceCalculatorController());
  }
}
