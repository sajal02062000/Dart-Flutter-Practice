import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui_clone/Constants/custom_colors.dart';
import 'package:whatsapp_ui_clone/Providers/cart_provider.dart';
import 'package:whatsapp_ui_clone/Screens/cart_screen.dart';
import 'package:whatsapp_ui_clone/Widgets/spacing.dart';

import '../Constants/products_data.dart';
import '../Widgets/styled_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.darkGreen,
        title: StyledText(
          text: "Whatsapp UI Clone",
          fontSize: 18,
          fontColor: CustomColors.white,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            ),
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart_outlined),
                Transform.translate(
                  offset: Offset(-10, -10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.red,
                    ),
                    padding: EdgeInsets.all(6),
                    child: StyledText(
                      text:
                          "${context.watch<CartProvider>().productsInCart.length}",
                      fontColor: CustomColors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: [
          ...products.map(
            (e) => Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                children: [
                  StyledText(text: e.name, fontSize: 16),
                  Spacing(),
                  StyledText(text: "${e.price}"),
                  ElevatedButton(
                    onPressed: () {
                      if (context.read<CartProvider>().productsInCart.any(
                        (element) => element.id == e.id,
                      )) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        );
                      } else {
                        context.read<CartProvider>().addToCart(e);
                      }
                    },
                    child: StyledText(
                      text:
                          context.watch<CartProvider>().productsInCart.any(
                            (element) => element.id == e.id,
                          )
                          ? "Go To Cart"
                          : "Add To Cart",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
