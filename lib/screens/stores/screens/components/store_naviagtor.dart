import 'package:flutter/material.dart';

import '../../../products/screens/products.dart';

void storeNavigator({required int index, required context}) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;

    case 6:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;

    case 7:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()),
      );
      break;
    default:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Items()), // Default case
      );
      break;
  }
}
