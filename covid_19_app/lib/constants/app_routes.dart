import 'package:flutter/material.dart';
import 'package:covid_19_app/presentation/presentation.dart';

class AppRoutes {
  static String home = '/home_page';
  static String info = '/info_page';

  static var routes = {
    home: (_) => HomePage(),
    info: (_) => InfoPage(),
  };
}
