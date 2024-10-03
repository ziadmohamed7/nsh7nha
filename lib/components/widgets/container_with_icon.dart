import 'package:flutter/material.dart';
import 'package:nsh7nha/constants.dart';

class ContainerWithIcon extends StatelessWidget {
  const ContainerWithIcon({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: greyColor),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image(
          width: 24,
          height: 24,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
