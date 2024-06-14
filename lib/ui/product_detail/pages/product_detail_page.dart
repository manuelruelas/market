import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text("Mazda 3 2016",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                  Text("4.5", style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("10 reviews", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text("\$300,000",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  FilledButton.icon(
                    onPressed: () {},
                    label: const Text("Mapa"),
                    icon: const Icon(
                      Icons.map,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Descripción",
                      style: Theme.of(context).textTheme.headlineMedium),
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.email),
                  onPressed: () {},
                  label: const Text('Contactar vendedor'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
