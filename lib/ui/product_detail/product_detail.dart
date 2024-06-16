import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/di.dart';
import 'package:market/ui/product_detail/cubit/product_detail_cubit.dart';
import 'package:market/ui/product_detail/pages/product_detail_page.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailCubit>()..getProductById(id),
      child: const ProductDetailPage(),
    );
  }
}
