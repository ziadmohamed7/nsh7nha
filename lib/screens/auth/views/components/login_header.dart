import 'package:flutter/material.dart';
import 'package:nsh7nha/generated/l10n.dart';

import '../../../../constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/logo/logo3.png'),
          height: 100,
        ),
        const SizedBox(
          height: defaultPadding * 2,
        ),
        Text(
          S.of(context).title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
