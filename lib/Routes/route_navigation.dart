import 'package:flutter/material.dart';
import 'package:machinetest_kjbn/Routes/route_names.dart';

import '../screens/home_page.dart';
import '../screens/splash_screen.dart';

class RouteNavigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());

      case RouteName.home:
        return MaterialPageRoute(builder: (context)=>const HomePage());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}