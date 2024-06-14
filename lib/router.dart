import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market/ui/product_list/pages/product_list_page.dart';

final routerConfig = GoRouter(initialLocation: '/product-list', routes: [
  GoRoute(
    path: '/product-list',
    builder: (context, state) => const ProductListPage(),
  ),
  GoRoute(
      path: '/product/:id', builder: (context, state) => const Placeholder()),
  GoRoute(
      path: '/contact-form', builder: (context, state) => const Placeholder())
]);
