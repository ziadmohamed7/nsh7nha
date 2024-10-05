import 'package:flutter/material.dart';

import '../../../components/widgets/build_grid_item.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen height to make item dimensions responsive
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1 / 1.82,
                children: List.generate(
                    5,
                    (index) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Grid_item(
                              image:
                                  "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                              new_price: 300,
                              old_price: 400,
                              product_name:
                                  "كارت بلايستيشن شحن الامارات بلابلابلا"),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  Grid_item(image: "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",new_price: 300,old_price: 400,product_name: "zooza"),
