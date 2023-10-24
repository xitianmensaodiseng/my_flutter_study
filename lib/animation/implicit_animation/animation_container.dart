import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animated_switcher.dart';

class AnimationContainerPage extends StatefulWidget {
  const AnimationContainerPage({super.key});

  @override
  State<AnimationContainerPage> createState() => _AnimationContainerPageState();
}

class _AnimationContainerPageState extends State<AnimationContainerPage> {


  double heightContainer = 300;

  double widgetContainer = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('这是一个隐式动画界面'),
      ),
      body: Center(
        child: AnimatedContainer(
          height: heightContainer,
          width: widgetContainer,
          color: Colors.cyanAccent,
          duration: const Duration(seconds: 2),
          child:Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('你好动画'),
                Text('Container高度：$heightContainer'),
                Text('Container宽度：$widgetContainer'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const Icon(
                Icons.minimize_outlined
            ),
            onPressed: () {
              setState(() {
                if(heightContainer<=20||widgetContainer<=20){
                  heightContainer=300;
                  widgetContainer=300;
                }
                heightContainer-=10;
                widgetContainer-=20;
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
                  return const AnimatedSwitcherPage();
                }));
              });
            },
          ),

        ],
      ),
    );
  }
}
