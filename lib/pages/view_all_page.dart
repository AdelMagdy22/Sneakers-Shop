import 'package:flutter/material.dart';
import 'package:sneakershop/components/shoes_items.dart';
import 'package:sneakershop/models/cart.dart';
import 'package:sneakershop/models/shoe.dart';

class ViewAllPage extends StatelessWidget {
  final void Function(Shoe) addShoeToCart;
  final Cart value;
  ViewAllPage({super.key, required this.value, required this.addShoeToCart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar
        //list of pick up shoes to sell
        ShoesItems(
          val: value,
          addShoeToCart: addShoeToCart,
          countItem: value.getShoesForSale.length,
        )
      ],
    );
  }
}
