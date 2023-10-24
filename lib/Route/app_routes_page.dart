import 'package:flutter/cupertino.dart';

import '../animation/implicit_animation/animated_widget.dart';
import '../page/english_words_page.dart';
import '../page/home.dart';
import '../page/second_route_page.dart';
import '../scrllable/listview_page.dart';
import '../scrllable/sliver_page/scrollable_page.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, Widget Function(BuildContext)> routes = {
    "home": (context) => const FirstRoutePage(),
    "SecondRoutePage": (context) => const SecondRoutePage(),
    "ScrollablePage": (context) => const ScrollablePage(),
    "ListviewPage": (context) => const ListViewPage(),
    "random_words_page": (context) => const RandomWordsWiget(),
    "Animationage": (context) => const AnimationPage(),
  };
}

