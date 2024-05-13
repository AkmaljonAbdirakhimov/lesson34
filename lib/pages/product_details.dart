import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatelessWidget {
  final String productTitle;
  final String productImage;
  final String productDescription;

  const ProductDetails({
    required this.productDescription,
    required this.productImage,
    required this.productTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.abc),
        ),
        title: Text(productTitle),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productImage),
              ),
            ),
          ),
          const Gap(20),
          Text(
            productTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          Text(productDescription),
        ],
      ),
    );
  }
}
