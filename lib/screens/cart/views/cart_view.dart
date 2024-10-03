// cart_view.dart

import 'package:flutter/material.dart';
import 'package:nsh7nha/screens/cart/views/components/empty_shopping_cart.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home.dart';

import '../../../generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        appBar: AppBar(
          title: Text(
            S.of(context).cartTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: const EmptyShoppingCart());
  }
}
