import 'package:dartz/dartz.dart';
import 'package:go_router/go_router.dart';
import 'package:market/ui/contact_form/pages/contact_form_page.dart';
import 'package:market/ui/product_detail/pages/product_detail_page.dart';
import 'package:market/ui/product_detail/product_detail.dart';
import 'package:market/ui/product_list/product_list.dart';

final routerConfig = GoRouter(initialLocation: '/product-list', routes: [
  GoRoute(
    path: '/product-list',
    builder: (context, state) => const ProductList(),
  ),
  GoRoute(
    path: '/product/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return ProductDetail(
        id: id,
      );
    },
  ),
  GoRoute(
      path: '/contact-form',
      builder: (context, state) => const ContactFormPage())
]);
