import 'package:flutter/material.dart';
import 'package:sneakershop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // total price of items in the cart
  double get total {
    double total = 0;
    for (Shoe shoe in userCart) {
      total += double.parse(shoe.price);
    }
    return total;
  }

  // list of shoes for sale
  List<Shoe> shoesForSale = [
    Shoe(
      name: "Air Jordan",
      price: '220',
      imagePath: 'assets/images/AirJordan.png',
      description:
          'got the hops, the speed-lace up in shoes gives you good experience.',
    ),
    Shoe(
      name: "Kyrie",
      price: '190',
      imagePath: 'assets/images/Kyrie.png',
      description:
          'packs the most cushioning tech out of all the shoes in the line.',
    ),
    Shoe(
      name: "Kd Treys",
      price: '200',
      imagePath: 'assets/images/KdTREY.png',
      description:
          'A secure midfoot strap is suited for scoring binges and definsive.',
    ),
    Shoe(
      name: "Lebron",
      price: '250',
      imagePath: 'assets/images/lebron.png',
      description:
          'The LeBron 18 is designed to maximize speed and power.',
    ),
    Shoe(
      name: "Paul George",
      price: '180',
      imagePath: 'assets/images/PG.png',
      description:
          'The PG 4 is a low-top basketball shoe that Paul George wears.',
    ),
    Shoe(
      name: "Kobe",
      price: '200',
      imagePath: 'assets/images/Kobe.png',
      description:
          'The Kobe 5 Protro is a low-top basketball shoe that Kobe Bryant wears.',
    ),
    Shoe(
      name: "Curry",
      price: '190',
      imagePath: 'assets/images/Curry.png',
      description:
          'The Curry 8 is a low-top basketball shoe that Stephen Curry wears.',
    ),
    Shoe(
      name: "ZoomFreak",
      price: '236',
      imagePath: 'assets/images/ZoomFreak.png',
      description:
          'The forward-thinking design of his latest signature shoe.',
    ),
  ];

  // list of items in the user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> get getShoesForSale => shoesForSale;

  // get userCart
  List<Shoe> get getUserCart => userCart;

  // add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
