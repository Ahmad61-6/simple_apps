import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/assets_path.dart';

class GroceryItemTileController extends GetxController {
  final List _shopItems = [
    ['Avocado', '4.00', (AssetsPath.avocado), Colors.green],
    ['Banana', '2.00', (AssetsPath.banana), Colors.redAccent],
    ['Burger', '12.00', (AssetsPath.burger), Colors.orangeAccent],
    ['Milk', '5.50', (AssetsPath.milk), Colors.black],
  ];
  get shopItems => _shopItems;
}
