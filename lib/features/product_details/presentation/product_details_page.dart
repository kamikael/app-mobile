import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du produit'),
      ),
      body: Center(
        child: Text(
          'Ici, on affichera image, prix, description, boutons + / - et Buy Now',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
