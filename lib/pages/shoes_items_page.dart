import 'package:flutter/material.dart';
import 'package:sneakershop/components/shoes_items.dart';
import 'package:sneakershop/models/cart.dart';
import 'package:sneakershop/models/shoe.dart';

// ignore: must_be_immutable
class ShoesItemsPage extends StatelessWidget {
  final Cart val;
  void Function(Shoe) addShoeToCart;
  final int countItem;
  ShoesItemsPage({
    super.key,
    required this.val,
    required this.addShoeToCart,
    required this.countItem,
  });

  @override
  Widget build(BuildContext context) {
    return ShoesItems(
      val: val,
      addShoeToCart: addShoeToCart,
      countItem: countItem,
    );
  }
}
