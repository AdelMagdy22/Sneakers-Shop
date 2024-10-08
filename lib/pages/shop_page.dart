import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/models/cart.dart';
import 'package:sneakershop/models/shoe.dart';
import 'package:sneakershop/pages/shoes_items_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    // show dialog box to ask user to confirm adding shoe to cart with yes or no
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add to Cart'),
        content: Text('Do you want to add ${shoe.name} to cart?'),
        actions: [
          TextButton(
            onPressed: () {
              // remove shoe from cart
              Provider.of<Cart>(context, listen: false)
                  .removeItemFromCart(shoe);
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // add shoe to cart
              Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              // message
              Text(
                textAlign: TextAlign.center,
                'everyone flies.. some fly longer than others',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          // hot picks
          _selected
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'All Shoes',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // navigate to view all page
                          setState(() {
                            _selected = false;
                          });
                        },
                        child: const Text(
                          'View Hot Picks 🔥',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hot Picks 🔥',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // navigate to view all page
                          setState(() {
                            _selected = true;
                          });
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(height: 25.0),

          // list of pick up shoes to sell
          _selected
              ? // show all shoes
              ShoesItemsPage(
                  val: value,
                  addShoeToCart: addShoeToCart,
                  countItem: value.getShoesForSale.length,
                )
              : // show Hot Picks
              ShoesItemsPage(
                  val: value,
                  addShoeToCart: addShoeToCart,
                  countItem: 4,
                ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(
              child: Text(
                'Sneakers Shop',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
