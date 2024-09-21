import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/presentation/ui/screens/cart_screen.dart';
import 'package:grocery_shop_app/presentation/ui/state_holders/cart_screen_controller.dart';
import 'package:grocery_shop_app/presentation/ui/state_holders/grocery_item_tile_controller.dart';

import '../widgets/grocery_item_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        ),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Good Morning,',
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                    fontSize: 45, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 28,
              ),
              Divider(
                color: Colors.grey.shade300,
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Fresh items',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: GetBuilder<GroceryItemTileController>(
                    builder: (controller) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                    itemCount: controller.shopItems.length,
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: controller.shopItems[index][0],
                        itemPrice: controller.shopItems[index][1],
                        imagePath: controller.shopItems[index][2],
                        color: controller.shopItems[index][3],
                        onPressed: () {
                          Get.find<CartScreenController>().addToCart(index);
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
