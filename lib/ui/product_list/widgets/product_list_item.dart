import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Image(
        height: 70,
        width: 70,
        fit: BoxFit.cover,
        image: AssetImage(
          'assets/images/carro-en-venta.jpeg',
        ),
      ),
      title: const Text('Product Name'),
      subtitle: const Text('Product Description'),
      trailing:
          Text('\$50,000.00', style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
