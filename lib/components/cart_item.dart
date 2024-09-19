// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/models/cart.dart';
import 'package:sneakershop/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  Cart cart;
  CartItem({
    super.key,
    required this.shoe,
    required this.cart,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    // show dialog box to ask user to confirm remove shoe to cart with yes or no
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove from Cart'),
        content: Text('Do you want to remove ${widget.shoe.name} from cart?'),
        actions: [
          TextButton(
            onPressed: () {
              // remove shoe from cart
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // add shoe to cart
              Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: ListTile(
        title: Text(
          widget.shoe.name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        leading: SizedBox(
          height: 60.0,
          width: 60.0,
          child: Image.asset(
            widget.shoe.imagePath,
          ),
        ),
        subtitle: Text(
          widget.shoe.price.toString(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
          ),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
