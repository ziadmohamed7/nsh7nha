import 'package:flutter/material.dart';

import '../../constants.dart';

class FlexibleDivider extends StatelessWidget {
  const FlexibleDivider(
      {super.key, required this.endIndent, required this.indent});
  final double endIndent;
  final double indent;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Divider(
        color: greyColor,
        endIndent: endIndent,
        indent: indent,
      ),
    );
  }
}
