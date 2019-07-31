import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context) {
  double widthScreen = MediaQuery.of(context).size.width;
  return widthScreen;
}

double getScreenHeight(BuildContext context) {
  double heightScreen = MediaQuery.of(context).size.height;
  return heightScreen;
}
