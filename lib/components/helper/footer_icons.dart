import 'package:flutter/material.dart';

import '../widgets/container_with_icon.dart';

class FooterIcons extends StatelessWidget {
  const FooterIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContainerWithIcon(
          image: 'assets/icons/icons8-google-192.png',
        ),
        SizedBox(
          width: 20,
        ),
        ContainerWithIcon(
          image: 'assets/icons/facebook.png',
        ),
        SizedBox(
          width: 20,
        ),
        ContainerWithIcon(
          image: 'assets/icons/apple-2.png',
        ),
      ],
    );
  }
}
