import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/models/cart.dart';
import 'package:sneakershop/models/shoe.dart';
import 'package:sneakershop/components/cart_item.dart';
import 'package:sneakershop/pages/check_out_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: cart.userCart.isEmpty
            ? const Center(
                child: Text('My Cart is empty'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // cart title
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // cart items
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.userCart.length,
                      itemBuilder: (context, index) {
                        Shoe invidualShoe = cart.getUserCart[index];
                        return CartItem(
                          shoe: invidualShoe,
                          cart: cart,
                        );
                      },
                    ),
                  ),
                  // total
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${cart.total.toString()}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // checkout button
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50.0,
                              vertical: 10.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CheckOutPage(userCart: cart,totalPrice: cart.total),
                              ),
                            );
                          },
                          child: const Text(
                            'Checkout',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
