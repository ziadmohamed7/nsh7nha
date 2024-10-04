import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveIndicator extends StatelessWidget {
  const AdaptiveIndicator({super.key, required this.os});

  final String os;

  @override
  Widget build(BuildContext context) {
    return os == 'ios'
        ? const Center(
            child: CupertinoActivityIndicator(),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
