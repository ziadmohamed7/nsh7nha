import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/adaptive/adaptive_button.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/generated/l10n.dart';
import 'package:nsh7nha/models/cart_model.dart';
import 'package:nsh7nha/screens/cart/views/components/cart_item.dart';
import 'package:nsh7nha/screens/cart/views/cubit/cart_cubit.dart';
import 'package:nsh7nha/screens/cart/views/cubit/cart_states.dart';

import '../../../components/helper/dio_helper.dart';
import '../../../components/helper/secure_storage.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getAllCartData(),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cartItems =
              CartCubit.get(context).cartModel?.data ?? []; // Your cart items
          final totalAmount =
              calculateTotal(cartItems); // Calculate total amount
          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).cartTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return CartItem(cartItem: cartItems[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total amount:',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: greyColor,
                                  fontSize: 20,
                                ),
                      ),
                      Text(
                        '$totalAmount EGP', // Show total amount
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  AdaptiveButton(
                    onPressed: () => makePayment(context, cartItems),
                    text: 'Check Out',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void makePayment(BuildContext context, List<Data> cartItems) async {
    final cartIds =
        cartItems.map((item) => item.id).toList(); // Collect item IDs
    const url = 'https://api.nsh7nha.com/api/orders'; // Update your URL
    final token =
        'Bearer ${await SecureStorage().getToken()}'; // Retrieve the token

    try {
      // Create the order on your backend
      final orderResponse = await DioHelper.postData(
        url: url,
        data: {'cart_ids': cartIds},
        token: token,
      );

      if (!orderResponse.data['success']) {
        throw Exception('Failed to create order');
      }

      final orderId = orderResponse.data['data']['id'];

      // Fetch the payment session using the orderId
      final paymentResponse = await DioHelper.getData(
        url: 'https://api.nsh7nha.com/api/payments/checkout/$orderId',
        token: token,
      );

      final paymentUrl = paymentResponse.data['data']['url'];
      //هتبعت بقي يسطا ال url لل webview

      //******* Navigate to the CheckoutWebView with the payment URL

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CheckoutWebView(url: paymentUrl),
      //   ),
      // );
    } catch (error) {
      print("Error during payment: $error");
      // Handle error appropriately, e.g., show a snackbar
    }
  }

  double calculateTotal(List<Data> cartItems) {
    return cartItems.fold(
      0,
      (total, item) =>
          total +
          (double.tryParse(item.card?.price ?? '0') ?? 0) * item.quantity!,
    );
  }
}
