import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market/di.dart';
import 'package:market/ui/product_list/cubit/product_list_cubit.dart';
import 'package:market/ui/product_list/widgets/product_list_item.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListCubit>(
      create: (context) => sl()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
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
                ],
              ),
            ),
            BlocBuilder<ProductListCubit, ProductListState>(
              builder: (context, state) {
                return SliverList.separated(
                  itemCount: state.products.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade300,
                  ),
                  itemBuilder: (context, index) {
                    return ProductListItem(
                      product: state.products[index],
                      onTap: () {
                        context.push('/product/1');
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
