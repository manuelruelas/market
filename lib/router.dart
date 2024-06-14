import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market/ui/contact_form/pages/contact_form_page.dart';
import 'package:market/ui/product_detail/pages/product_detail_page.dart';
import 'package:market/ui/product_list/pages/product_list_page.dart';

final routerConfig = GoRouter(initialLocation: '/product-list', routes: [
  GoRoute(
    path: '/product-list',
    builder: (context, state) => const ProductListPage(),
  ),
  GoRoute(
    path: '/product/:id',
    builder: (context, state) => const ProductDetailPage(),
  ),
  GoRoute(
      path: '/contact-form',
      builder: (context, state) => const ContactFormPage())
]);
