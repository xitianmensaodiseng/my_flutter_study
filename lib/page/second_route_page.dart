import 'package:flutter/material.dart';

class SecondRoutePage extends StatefulWidget {
  const SecondRoutePage({super.key});

  @override
  State<SecondRoutePage> createState() => _SecondRoutePageState();
}

class _SecondRoutePageState extends State<SecondRoutePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    //动画执行时间3秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var args=ModalRoute.of(context)?.settings.arguments;
    debugPrint('$args');

    return Scaffold(
      appBar: AppBar(title: const Text('这是第二个路由界面'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
          Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue.shade50,
            child: const Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          const Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
          const Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment(2,0.0),
            child: FlutterLogo(
              size: 60,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(" hello world ", style: TextStyle(fontSize: 30.0),),
              Text(" I am Jack "),
            ],
          ),
          Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop("我是一个返回的值");
                },
                child: const Text('点击这里返回到上一个路由页面'),
              )),
              Padding(
               padding: const EdgeInsets.all(16),
                  child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                          .animate(_animationController), // 从灰色变成蓝色
                      value: _animationController.value,
                  ),
              ),
        ],
      ),
    );
  }
}
