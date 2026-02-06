import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui_clone/Providers/cart_provider.dart';
import 'package:whatsapp_ui_clone/Widgets/styled_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledText(text: "Cart")),
      body: ListView(
        children: [
          ...context.watch<CartProvider>().productsInCart.map(
            (e) => Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StyledText(text: e.name, fontSize: 16),
                  StyledText(text: "${e.price}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
