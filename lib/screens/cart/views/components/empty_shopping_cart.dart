import 'package:flutter/material.dart';

import '../../../../adaptive/adaptive_button.dart';
import '../../../../constants.dart';

class EmptyShoppingCart extends StatelessWidget {
  const EmptyShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/empty_cart.png'),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const Text(
            'Your shopping cart is empty',
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Text(
            'Fortunately , there\'s an easy solution . ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: defaultPadding * 2,
          ),
          AdaptiveButton(
            onPressed: () {},
            text: 'Go Shopping',
          ),
        ],
      ),
    );
  }
}
