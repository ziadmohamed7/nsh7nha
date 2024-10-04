// cart_view.dart

import 'package:flutter/material.dart';
import 'package:nsh7nha/adaptive/adaptive_button.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home.dart';

import '../../../constants.dart';
import '../../../generated/l10n.dart';
import 'components/cart_item.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartItem();
                },
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total amount:',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: greyColor,
                        fontSize: 20,
                      ),
                ),
                Text(
                  '\$1200',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            AdaptiveButton(onPressed: () {}, text: 'Check Out'),
          ],
        ),
      ),
    );
  }
}
