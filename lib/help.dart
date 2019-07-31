import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FadeTransactionPageRoute extends CupertinoPageRoute {
  Widget _widget;

  FadeTransactionPageRoute(this._widget)
      : super(builder: (BuildContext context) => _widget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage

    return new FadeTransition(opacity: animation, child: _widget);
  }
}