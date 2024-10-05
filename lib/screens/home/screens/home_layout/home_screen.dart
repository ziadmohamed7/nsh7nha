import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/component/category_navigator.dart';
import 'package:nsh7nha/screens/home/screens/home_layout/home_cubit/store_cubit.dart';

import '../../../../components/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> addvertsment_images = [
    const Image(
      image: AssetImage('assets/header/ea-sports-fc-25_bfxb.jpg'),
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    const Image(
      image: AssetImage('assets/header/istockphoto-1287493837-612x612.jpg'),
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    // const Image(
    //   image: AssetImage('assets/header/controller.png'),
    //   width: double.infinity,
    //   fit: BoxFit.cover,
    // ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double halfScreenWidth = MediaQuery.of(context).size.width / 3 - 50;

    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          height: 100,
          width: 90,
          child: Image(
            image: AssetImage('assets/logo/logo.png'),
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            // images
            Expanded(
              flex: 2,
              child: Container(
                child: CarouselSlider(
                    items: addvertsment_images,
                    options: CarouselOptions(
                        height: 300,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 1)),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: AppCubit.get(context).categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      categoryNavigator(index: index, context: context);
                    },
                    child: CategoryCard(
                      height: 60,
                      width: 60,
                      category: AppCubit.get(context).categories[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
