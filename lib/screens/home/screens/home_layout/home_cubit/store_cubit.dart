import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/components/helper/api.dart';
import 'package:nsh7nha/constants.dart';
import 'package:nsh7nha/screens/cart/views/cart_view.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_cubit/store_states.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_screen.dart';
import 'package:nsh7nha/screens/profile/secreens/user_profile.dart';

import '../../../../../components/helper/dio_helper.dart';
import '../../../../../components/helper/secure_storage.dart';
import '../../../../../models/cart_model.dart';
import '../../../../../models/favourit_model.dart';
import '../../../../../models/products_model.dart';
import '../../../../favourit/screens/favourit_view.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int current_index = 0;

  List<TabItem> bottomItems = [
    const TabItem(
      icon: Icon(Icons.home, color: greyColor, size: 30),
    ),
    const TabItem(
      icon: Icon(Icons.shopping_cart_rounded, color: greyColor, size: 30),
    ),
    const TabItem(
      icon: Icon(Icons.favorite_border, color: greyColor, size: 30),
    ),
    const TabItem(
      icon: Icon(Icons.account_circle, color: greyColor, size: 30),
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    const CartView(),
    const Favorits(),
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

  CardsModel? cards_model;

  void get_countrycards_car({
    required int categoryId,
    required int countryId,
  }) async {
    emit(Get_counteycarde_loding_state());
    await Api()
        .get(
            path:
                'https://api.nsh7nha.com/api/cards?country_id=$countryId&category_id=$categoryId')
        .then((value) {
      print(value.data);
      cards_model = CardsModel.fromJson(value.data);
      print("Cards length: ${cards_model!.data!.length}");
      emit(Get_counteycarde_success_state());
    }).catchError((error) {
      print("Error fetching cards: $error");
      emit(Get_counteycarde_error_state());
    });
  }

  AllFavoritsModel? allfavoritsmodel;

  void get_favorits_car() async {
    emit(Get_favorits_loding_state());
    await DioHelper.getData(
            url: 'https://api.nsh7nha.com/api/card-favorites',
            token: 'Bearer ${await SecureStorage().getToken()}')
        .then((value) {
      print(value.data);
      allfavoritsmodel = AllFavoritsModel.fromJson(value.data);
      print(allfavoritsmodel!.data!.length);
      emit(Get_favorits_success_state());
    }).catchError((error) {
      emit(Get_favorits_error_state());
    });
  }

  void favorit_toggle({
    required id,
  }) {
    emit(favorit_toggle_loding_state());
    DioHelper.postData(
      url: 'https://api.nsh7nha.com/api/card-favorites/toggle',
      data: {"card_id": id},
    ).then((value) {
      print("value ${value.data}");
      print("status ${value.statusCode}");

      emit(favorit_toggle_success_state());

      get_favorits_car();
    }).catchError((error) {
      print("error $error");
      emit(favorit_toggle_success_state());
    });
  }

  CartModel? cartModel;

  void getAllCartData() async {
    emit(StoreCartLoadingState());
    await DioHelper.getData(
            url: 'https://api.nsh7nha.com/api/carts',
            token: 'Bearer ${await SecureStorage().getToken()}')
        .then((value) {
      print(value.data);
      cartModel = CartModel.fromJson(value.data);
      print(cartModel!.data!.length);
      emit(StoreCartSuccessState());
    }).catchError((error) {
      emit(StoreCartErrorState());
    });
  }
}
