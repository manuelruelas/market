import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/carro-en-venta.jpeg',
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Product Name'),
                Text('\$50,000.00',
                    style: Theme.of(context).textTheme.titleMedium),
                const Text('Product Description'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
