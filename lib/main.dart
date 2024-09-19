import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/models/cart.dart';
import 'package:sneakershop/pages/intro_page.dart';
import 'package:sneakershop/theme/theme_provider.dart';

void main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sneaker Shop',
            theme: Provider.of<ThemeProvider>(context, listen: false).themeMode,
            home: const IntroPage(),
          );
        },
      ),
    );
  }
}
// No additional Dart code is needed here. The provided Android configuration should be placed in the `build.gradle` file of your Android module, not in the Dart file.