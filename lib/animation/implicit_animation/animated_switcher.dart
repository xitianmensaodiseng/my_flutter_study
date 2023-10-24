import 'package:flutter/material.dart';

import 'curves_opacity.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({super.key});

  @override
  State<AnimatedSwitcherPage> createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  bool alter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcherPage不同控件间的过度'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('这是个提供切换不同控件动画的控件'),
          Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.cyanAccent,
              child: Center(
                child: AnimatedSwitcher(
                  //transitionBuilder：transitionBuilder 属性是一个自定义函数，
                  // 用于定义切换时的过渡效果。该函数接受两个参数：child 表示当前子控件，
                  // animation 表示当前动画的状态。你可以根据这两个参数自定义切换动画效果。
                  duration: const Duration(seconds: 3),
                  child: alter
                      ? const Text('不同控件')
                      : Container(
                          height: 20,
                          width: 20,
                          color: Colors.red,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.alternate_email),
            onPressed: () {
              setState(() {
                alter = !alter;
              });
            },
          ),
          TextButton(
            child: const Icon(
                Icons.navigate_next
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return  const CurvesAndOpacity();
                }));
              });
            },
          ),

        ],
      ),

    );
  }
}
