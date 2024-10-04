import 'package:flutter/material.dart';
import 'package:nsh7nha/constants.dart';

import '../widgets/container_with_icon.dart';

class FooterIcons extends StatelessWidget {
  const FooterIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ContainerWithIcon(
          image: 'assets/icons/icons8-google-192.png',
        ),
        const SizedBox(
          width: 20,
        ),
        const ContainerWithIcon(
          image: 'assets/icons/facebook.png',
        ),
        const SizedBox(
          width: 20,
        ),
        getOperatingSystem() == 'ios'
            ? const ContainerWithIcon(
                image: 'assets/icons/apple-2.png',
              )
            : Container(),
      ],
    );
  }
}
