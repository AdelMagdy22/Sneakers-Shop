import 'package:flutter/material.dart';
// import 'package:sneakershop/components/bottom_nav_bar.dart';
// import 'package:sneakershop/components/mode_switch.dart';
// import 'package:sneakershop/pages/admin/add_shoe_page.dart';
import 'package:sneakershop/pages/cart_page.dart';
import 'package:sneakershop/pages/intro_page.dart';
import 'package:sneakershop/pages/settings_page.dart';
import 'package:sneakershop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index will be used to change the page
  int _selectedIndex = 0;

  // this list will be used to change the page
  final List<Widget> _page = [
    // the pages that will be displayed
    const ShopPage(),
    const CartPage(),
    // const AddShoePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Navigate to Cart
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 250.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: const Center(
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                // Home
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                      ),
                      title: Text(
                        'Shop',
                      ),
                    ),
                  ),
                ),
                // Cart
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // setState(() {
                    //   _selectedIndex = 1;
                    // });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                      ),
                      title: Text(
                        'Cart',
                      ),
                    ),
                  ),
                ),
                // Settings
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                      ),
                      title: Text(
                        'Settings',
                      ),
                    ),
                  ),
                ),
                // about us
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                    ),
                    title: Text(
                      'About Us',
                    ),
                  ),
                ),
              ],
            ),
            // logout
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const IntroPage(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 25.0,
                  bottom: 25.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: Text(
                    'Logout',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _page[_selectedIndex],
    );
  }
}
