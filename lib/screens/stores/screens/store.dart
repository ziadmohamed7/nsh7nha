import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_cubit/store_states.dart';

import '../../../components/widgets/category_card.dart';
import '../../home/screens/home_layout/home_cubit/store_cubit.dart';
import 'components/store_naviagtor.dart';

class StoresCountry extends StatelessWidget {
  const StoresCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
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
                      storeNavigator(index: index, context: context);
                    },
                    child: CategoryCard(
                      height: 150,
                      width: 150,
                      category: AppCubit.get(context).stores[index],
                      // style: CategoryCardStyle(
                      //   borderRadius: BorderRadius.circular(15),
                      //   shadowColor: Colors.grey.withOpacity(0.3),
                      //   elevation: 5,
                      //   textStyle: const TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.black,
                      //   ),
                      //   backgroundColor: Colors.white,
                      // ),
                    ),
                  );
                },
              ),
            ),
            backgroundColor:
                Colors.grey[200], // Light background to contrast with cards
          );
        },
      ),
    );
  }
}
