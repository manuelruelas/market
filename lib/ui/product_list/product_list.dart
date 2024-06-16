import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/di.dart';
import 'package:market/ui/product_list/cubit/product_list_cubit.dart';
import 'package:market/ui/product_list/pages/product_list_page.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListCubit>(
      create: (context) => sl()..getProducts(),
      child: const ProductListPage(),
    );
  }
}
