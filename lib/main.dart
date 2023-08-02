import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_website/view/home.dart';

void main() {
  runApp(MyApp());
  //remove debug banner
  debugPaintSizeEnabled = false;
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}
