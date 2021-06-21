import 'package:flutter/material.dart';
import 'package:resizrr/routes/route_names.dart';
import 'package:resizrr/views/home_screen/home_screen.dart';
import 'package:resizrr/views/select_image/select_image.dart';

import 'custom_route.dart';

class Routes {
  // static dynamic route() {
  //   return {
  //     splash: (BuildContext context) => SplashScreen(),
  //   };
  // }

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.selectImage:
        return CustomRoute<bool>(
            builder: (BuildContext context) => SelectImage());
      case RouteNames.homeScreen:
        return CustomRoute<bool>(
            builder: (BuildContext context) => HomeScreen());
      default:
        return onUnknownRoute(const RouteSettings(name: '/invalid'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(settings.name!.split('/')[1]),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name} Comming soon..'),
        ),
      ),
    );
  }
}
