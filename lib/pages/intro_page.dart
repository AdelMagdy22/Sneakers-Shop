// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sneakershop/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo image
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 240.0,
                ),
              ),
          
              const SizedBox(height: 48),
          
              //title
              const Text(
                'Snkeaers Shop',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              // sub-title
              Text(
                'Made With Flutter',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 24),

              // sub-subtitle
              Text(
                'Brand new collection of sneakers made with premium quality',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 24),

              //stat now button
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25.0),
                  child:  const Center(
                    child:  Text("Shop Now",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
