import 'package:flutter/material.dart';

import '../../../../stores/screens/store.dart';

void categoryNavigator({required int index, required context}) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresCountry()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresCountry()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresCountry()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoresCountry()),
      );
      break;
  }
}
