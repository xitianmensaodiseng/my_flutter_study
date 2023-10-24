import 'package:flutter/material.dart';
import 'package:my_flutter_study/animation/implicit_animation/tween_animation.dart';

class CurvesAndOpacity extends StatefulWidget {
  const CurvesAndOpacity({super.key});

  @override
  State<CurvesAndOpacity> createState() => _CurvesAndOpacityState();
}

class _CurvesAndOpacityState extends State<CurvesAndOpacity> {
  double intOpacity = 0.1;
  double AnimatedPaddingCountt = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpacityAndCurves透明度和曲线'),
      ),
      body: ListView(
          children: [
            const Text('这是个提供透明度，以及动画以什么状态的属性页面'),
            Center(
              child: AnimatedOpacity(
                curve: Curves.bounceInOut,//代表动画以什么状态变化
                opacity: intOpacity, //0~1表示透明度范围
                duration: const Duration(seconds: 2),
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),

            AnimatedPadding(
              padding: EdgeInsets.all(AnimatedPaddingCountt),
              duration: const Duration(seconds: 2),
              curve: Curves.bounceOut,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blueAccent,
                child: Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                if (intOpacity <= 0.9) {
                  intOpacity += 0.3;
                } else {
                  intOpacity = 0.1;
                }
                if (AnimatedPaddingCountt <= 100) {
                  AnimatedPaddingCountt += 10;
                } else {
                  AnimatedPaddingCountt = 3;
                }


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
                  return  const TweenAnimationPage();
                }));
              });
            },
          ),

        ],
      ),

    );
  }
}
