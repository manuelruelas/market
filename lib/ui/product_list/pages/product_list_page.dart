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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        top: false,
        child: BlocBuilder<ProductListCubit, ProductListState>(
          builder: (context, state) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                const SliverAppBar(
                  floating: true,
                  title: Text('Ultimos productos'),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.search),
                        hintText: 'Buscar...',
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
                SliverList.separated(
                  itemCount: state.products.length,
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemBuilder: (context, index) {
                    if (index == state.products.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ProductListItem(
                      product: state.products[index],
                      onTap: () {
                        context.push('/product/1');
                      },
                    );
                  },
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: state.status == ProductListStatus.loading
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
