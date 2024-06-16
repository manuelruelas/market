import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market/ui/product_list/cubit/product_list_cubit.dart';
import 'package:market/ui/product_list/widgets/product_list_item.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ProductListCubit>().getProducts();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.95);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: CustomScrollView(
        controller: _scrollController,
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
          // SliverToBoxAdapter(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           // TODO: Implement filter logic for button 1
          //         },
          //         child: const Text('Button 1'),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           // TODO: Implement filter logic for button 2
          //         },
          //         child: const Text('Button 2'),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //           // TODO: Implement filter logic for button 3
          //         },
          //         child: const Text('Button 3'),
          //       ),
          //     ],
          //   ),
          // ),
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
          if (context.read<ProductListCubit>().state.status ==
              ProductListStatus.loading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
