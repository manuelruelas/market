import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market/ui/product_detail/cubit/product_detail_cubit.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SafeArea(
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            if (state.status == ProductDetailStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  BlocBuilder<ProductDetailCubit, ProductDetailState>(
                    builder: (context, state) {
                      return CarouselSlider(
                        items: state.product?.imageUrls
                            ?.map(
                              (url) => Image.asset(
                                "assets/images/carro-en-venta.jpeg",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  log(error.toString());
                                  return const Center(
                                    child: Icon(Icons.error),
                                  );
                                },
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<ProductDetailCubit,
                              ProductDetailState>(
                            builder: (context, state) {
                              return Text(state.product?.name ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall);
                            },
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                        ),
                        BlocBuilder<ProductDetailCubit, ProductDetailState>(
                          builder: (context, state) {
                            return Text(state.product?.rating.toString() ?? "-",
                                style: Theme.of(context).textTheme.bodyMedium);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<ProductDetailCubit,
                              ProductDetailState>(
                            builder: (context, state) {
                              return Text(
                                  "\$${state.product?.price.toStringAsFixed(2) ?? "No disponible"}",
                                  style:
                                      Theme.of(context).textTheme.titleLarge);
                            },
                          ),
                        ),
                        OutlinedButton.icon(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Descripción",
                              style: Theme.of(context).textTheme.headlineSmall),
                          BlocBuilder<ProductDetailCubit, ProductDetailState>(
                            builder: (context, state) {
                              return Text(
                                state.product?.description ??
                                    "Descripción no disponible",
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: FilledButton.icon(
                        icon: const Icon(Icons.email),
                        onPressed: () {
                          context.push('/contact-form');
                        },
                        label: const Text('Contactar vendedor'),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
