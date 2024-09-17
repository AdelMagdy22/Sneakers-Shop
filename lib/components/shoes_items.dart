// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sneakershop/components/shoe_tile.dart';
import 'package:sneakershop/models/cart.dart';
import 'package:sneakershop/models/shoe.dart';

class ShoesItems extends StatelessWidget {
final Cart val;
  void Function(Shoe) addShoeToCart;
  final int countItem;
  ShoesItems({
    super.key,
    required this.val,
    required this.addShoeToCart,
    required this.countItem,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: countItem,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Shoe shoe = val.getShoesForSale[index];
          // return shoe tile
          return ShoeTile(
            shoe: shoe,
            onTap: () => addShoeToCart(shoe),
          );
        },
      ),
    );
  }
}