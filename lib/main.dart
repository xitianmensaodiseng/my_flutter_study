import 'package:flutter/material.dart';
import 'package:my_flutter_study/Route/app_routes_page.dart';
import 'package:my_flutter_study/page/english_words_page.dart';
import 'package:my_flutter_study/page/home.dart';
import 'package:my_flutter_study/page/second_route_page.dart';
import 'package:my_flutter_study/scrllable/listview_page.dart';
import 'package:my_flutter_study/scrllable/sliver_page/scrollable_page.dart';



void main(){
  runApp(const MyFlutter());
}

class MyFlutter extends StatefulWidget {
  const MyFlutter({Key? key}) : super(key: key);


  @override
  State<MyFlutter> createState() => _MyFlutterState();
}

class _MyFlutterState extends State<MyFlutter> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的Flutter学习之路',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:"home", //名为"home"的路由作为应用的home(首页)
      routes:
      // {
      //   "home":(context) => const FirstRoutePage(), //注册首页路由
      //   "SecondRoutePage":(context) => const SecondRoutePage(),
      //   "ScrollablePage":(context) => const ScrollablePage(),
      //   "ListviewPage":(context) => const ListViewPage(),
      // },
      AppRoutes.routes,
      // onGenerateRoute: (RouteSettings settings) {
      //   if (settings.name == "random_words_page") {
      //     // 如果需要登录验证，添加相应的逻辑
      //     // 如果不需要登录验证，可以直接返回 RandomWordsWidget
      //     return MaterialPageRoute(builder: (context) {
      //       return const RandomWordsWiget();
      //     });
      //   }
      //   return null;
      //   // 处理其他路由
      //   // ...
      // },

    );
  }
}


