import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import 'home_cubit/store_cubit.dart';
import 'home_cubit/store_states.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.current_index],
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: primaryColor,
              activeColor: primaryColor,
              color: Colors.grey[600],
              initialActiveIndex: cubit.current_index,
              onTap: (index) {
                cubit.changebottomnav(index);
              },
              items: cubit.bottomItems,
              elevation: 6,
              curveSize: 80,
              shadowColor: Colors.black.withOpacity(0.2),
              style:
                  TabStyle.reactCircle, // Removes labels and only shows icons
            ),
          );
        },
      ),
    );
  }
}
