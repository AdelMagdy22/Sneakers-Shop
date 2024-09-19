// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sneakershop/models/cart.dart';

class CheckOutPage extends StatefulWidget {
  final Cart userCart;
  final double totalPrice;
  const CheckOutPage(
      {super.key, required this.userCart, required this.totalPrice});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$",
      caseSensitive: false);

  void _submitForm() {
    // Perform form submission logic here
    String name = _nameController.text;
    String email = _emailController.text;
    String address = _addressController.text;

    // Example: Print the form values
    print('Name: $name');
    print('Email: $email');
    print('Address: $address');

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Show a success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Form submitted successfully!'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Clear the cart
                  widget.userCart.clearCart();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Show a dialog indicating that all fields are required
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('make sure that all fields entered correctly!'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Checkout Page',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Your Name is required!';
                  }
                  return null;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email address is required!';
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address!';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required!';
                  }
                  return null;
                },
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Total Price: \$${widget.totalPrice}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  'Submit',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
