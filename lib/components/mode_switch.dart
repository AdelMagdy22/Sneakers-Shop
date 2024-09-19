import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/theme/theme_provider.dart';

class ModeSwitch extends StatefulWidget {
  const ModeSwitch({super.key});
  

  @override
  State<ModeSwitch> createState() => _ModeSwitch();
}

class _ModeSwitch extends State<ModeSwitch> {
  bool dark = false;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          // This bool value toggles the switch.
          value: dark,
          activeColor: Theme.of(context).colorScheme.onBackground,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              dark = value;
            });
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
        ),
        // This is the image that will be displayed next to the switch.
        Image.asset(
          color: Theme.of(context).colorScheme.onBackground,
          !dark ? 'assets/images/sun.png' : 'assets/images/moon.png',
          width: 40,
          height: 40,
        ),
      ],
    );
  }
}