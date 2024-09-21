import 'package:get/get.dart';
import 'package:grocery_shop_app/presentation/ui/state_holders/grocery_item_tile_controller.dart';

class CartScreenController extends GetxController {
  final List _cartItems = [];

  get cartItems => _cartItems;

  void addToCart(int index) {
    _cartItems.add(Get.find<GroceryItemTileController>().shopItems[index]);
    update();
  }

  void deleteItemFromCart(int index) {
    _cartItems.removeAt(index);
    update();
  }
}
