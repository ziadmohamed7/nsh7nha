import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_cubit/store_states.dart';

import '../../../components/widgets/category_card.dart';
import '../../home/screens/home_layout/home_cubit/store_cubit.dart';
import 'components/store_naviagtor.dart';

class StoresCountry extends StatelessWidget {
  const StoresCountry({super.key, required this.categoryId});

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Stores',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: AppCubit.get(context).stores.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.85, // Adjusted ratio for card proportion
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    AppCubit.get(context).get_countrycards_car(
                        categoryId: categoryId, countryId: index);
                    print(AppCubit.get(context).cards_model);
                    storeNavigator(countryId: index, context: context);
                  },
                  child: CategoryCard(
                    height: 150,
                    width: 150,
                    category: AppCubit.get(context).stores[index],
                  ),
                );
              },
            ),
          ),
          backgroundColor:
              Colors.grey[200], // Light background to contrast with cards
        );
      },
    );
  }
}
