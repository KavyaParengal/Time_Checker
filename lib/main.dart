import 'package:flutter/material.dart';
import 'package:machinetest_kjbn/Routes/route_names.dart';
import 'package:machinetest_kjbn/Routes/route_navigation.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: RouteName.splashScreen,
    onGenerateRoute: RouteNavigation.generateRoute,
  ));
}
