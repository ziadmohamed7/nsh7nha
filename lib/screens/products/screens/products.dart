import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/adaptive/adaptive_indicatore.dart';
import 'package:nsh7nha/models/products_model.dart';

import '../../../components/widgets/build_grid_item.dart';
import '../../../constants.dart';
import '../../home/screens/home_layout/home_cubit/store_cubit.dart';
import '../../home/screens/home_layout/home_cubit/store_states.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height to make item dimensions responsive
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, Object? state) => Scaffold(
              appBar: AppBar(),
              body: ConditionalBuilder(
                condition: AppCubit.get(context).cards_model != null,
                builder: (context) =>
                    Items_builder(AppCubit.get(context).cards_model, context),
                fallback: (context) =>
                    Center(child: AdaptiveIndicator(os: getOperatingSystem())),
              ),
            ));
  }

  Widget Items_builder(CardsModel? cardsModel, context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1 / 1.82,
        children: List.generate(
            cardsModel!.data!.length,
            (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Grid_item(
                        image:
                            '$baseUrl/storage/${cardsModel.data![index].image}',
                        new_price: cardsModel.data![index].price,
                        old_price: 400,
                        product_name: cardsModel.data![index].title),
                  ),
                )),
      ),
    );
  }
}
//  Grid_item(image: "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",new_price: 300,old_price: 400,product_name: "zooza"),
