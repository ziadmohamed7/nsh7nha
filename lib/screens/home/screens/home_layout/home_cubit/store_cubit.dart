import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/screens/cart/views/cart_view.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_cubit/store_states.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_screen.dart';
import 'package:nsh7nha/screens/profile/secreens/user_profile.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int current_index = 0;

  List<TabItem> bottomItems = [
    const TabItem(
      icon: Icon(
        Icons.home,
        color: greyColor,
        size: 30,
      ),
    ),
    const TabItem(
      icon: Icon(
        Icons.shopping_cart_rounded,
        color: greyColor,
        size: 30,
      ),
    ),

    // TabItem(
    //   icon: Icon(
    //     Icons.favorite_border,
    //     color: greyColor,
    //     size: 30,
    //   ),
    // ),

    const TabItem(
      icon: Icon(
        Icons.account_circle,
        color: greyColor,
        size: 30,
      ),
    ),

    // TabItem(
    //   icon: Icon(
    //     Icons.w,
    //     color: greyColor,
    //     size: 30,
    //   ),
    // ),
  ];
  List<Widget> screens = [
    HomeScreen(),
    const CartView(),
    Profile(),
  ];

  void changebottomnav(int index) {
    current_index = index;
    emit(bottomnav_state());
  }

  List<Map<String, String>> categories = [
    {'title': 'Playstation', 'icon': 'assets/images/playsation.png'},
    {'title': 'Google play', 'icon': 'assets/images/google_play.png'},
    {'title': 'Itunes', 'icon': 'assets/icons/apple-2.png'},
    {'title': 'Steam', 'icon': 'assets/images/steam.png'},
    {'title': 'Recharge', 'icon': 'assets/images/currency.webp'}
  ];

  List<Map<String, String>> stores = [
    {'title': 'USA', 'icon': 'assets/stores/use.jpg'},
    {'title': 'UAE', 'icon': 'assets/stores/uae.jpg'},
    {'title': 'UK', 'icon': 'assets/stores/uk.jpg'},
    {'title': 'Lebanon', 'icon': 'assets/stores/lb.jpg'},
    {'title': 'Bahrain', 'icon': 'assets/stores/bh.webp'},
    {'title': 'Qatar', 'icon': 'assets/stores/qt.webp'},
    {'title': 'KSA', 'icon': 'assets/stores/ksa.webp'}
  ];
}
