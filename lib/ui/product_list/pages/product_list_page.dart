import 'package:flutter/material.dart';
import 'package:market/ui/product_list/widgets/product_list_item.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement filter logic for button 1
                  },
                  child: const Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement filter logic for button 2
                  },
                  child: const Text('Button 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement filter logic for button 3
                  },
                  child: const Text('Button 3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement filter logic for button 4
                  },
                  child: const Text('Button 4'),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const ProductListItem();
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
