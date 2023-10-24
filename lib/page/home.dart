import 'package:flutter/material.dart';
import 'package:my_flutter_study/Route/app_routes_page.dart';

class FirstRoutePage extends StatefulWidget {
  const FirstRoutePage({super.key});

  @override
  State<FirstRoutePage> createState() => _FirstRoutePageState();
}

class _FirstRoutePageState extends State<FirstRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('导航页'),
      ),
      body: ListView.separated(
        itemCount: AppRoutes.routes.length-1,
        itemBuilder: (context, index) {
            final routeName = AppRoutes.routes.keys.toList()[index+1]; // 获取路由名称列表
            return Align(
              alignment: Alignment.centerLeft, // 或 Alignment.topLeft
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(routeName);
                },
                child: Text('点击这里跳转到$routeName路由页面'),
              ),
            );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
      // body: ListView(
      //   children: [
      //     Align(
      //       alignment: Alignment.centerLeft,
      //       child: TextButton(
      //         onPressed: () async {
      //           Navigator.of(context).pushNamed('random_words_page');
      //         },
      //         child: const Text('点击这里跳转到RandomWordsWiget路由页面'),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.centerLeft,
      //       child: TextButton(
      //         // onPressed: () async {
      //         //   // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //         //   //   return const SecondRoutePage();
      //         //   // }));第一种跳转方式,不需要建立路由管理，直接跳转
      //
      //         //   var result = await Navigator.push(
      //         //     context,
      //         //     MaterialPageRoute(
      //         //       maintainState: false,
      //         //       //默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为 false。
      //         //       builder: (context) {
      //         //         return const SecondRoutePage();
      //         //       },
      //         //     ),
      //         //   );//这是第二种跳转方式
      //         //   debugPrint('$result'); //这个返回值的获取必须在async异步的情况下
      //         // },
      //         onPressed: () async {
      //           // var result = await Navigator.pushNamed(context, "new_second_page");
      //           // debugPrint('$result');
      //
      //           Navigator.pushNamed(context, "SecondRoutePage",
      //                   arguments: "我是传到第二个页面的数据")
      //               .then((value) => debugPrint('$value'));
      //         },
      //         child: const Text('点击这里跳转到SecondRoutePage路由页面'),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.centerLeft,
      //       child: TextButton(
      //         onPressed: () async {
      //           Navigator.of(context).pushNamed('ScrollablePage');
      //         },
      //         child: const Text('点击这里跳转到ScrollablePage路由页面'),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.centerLeft,
      //       child: TextButton(
      //         onPressed: () {
      //           Navigator.of(context).pushNamed('ListviewPage');
      //         },
      //         child: const Text('点击这里跳转到ListviewPage路由页面'),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
