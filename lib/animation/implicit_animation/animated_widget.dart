import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_study/animation/implicit_animation/animated_switcher.dart';

import '../explicit_animation/rotation_transition.dart';
import 'animation_container.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}


///目的让控件动起来
///只需两行代码
///Animated开头的控件和duration（持续时间）属性
///
///
class _AnimationPageState extends State<AnimationPage> {

   double heightContainer = 300;

   double widgetContainer = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('选择隐式动画界面/显式动画界面'),
      ),
      floatingActionButton: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: const Text("显式动画"),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const RotationTransitionPage();
                  }));
                });
              },
            ),
            TextButton(
              child:  const Text("隐式动画"),
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const AnimationContainerPage();
                  }));
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
