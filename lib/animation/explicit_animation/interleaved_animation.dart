import 'package:flutter/material.dart';

import 'custom_animation.dart';

class InterleavedAnimation extends StatefulWidget {
  const InterleavedAnimation({super.key});

  @override
  State<InterleavedAnimation> createState() => _InterleavedAnimationState();
}

class _InterleavedAnimationState extends State<InterleavedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int index = 1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interleaved animation'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(60),
            child: Text(
              '这个界面展示一种交错动画效果，体现管理区间和曲线',
              style: TextStyle(fontSize: 20),
            ),
          ),
          UnconstrainedBox(
            child: SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.2, 0))
                      .chain(CurveTween(curve: const Interval(0, 0.2)))),
              child: Container(
                height: 100,
                width: 200,
                color: Colors.cyanAccent[100],
              ),
            ),
          ),
          UnconstrainedBox(
            child: SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.2, 0))
                      .chain(CurveTween(curve: const Interval(0.2, 0.4)))),
              child: Container(
                height: 100,
                width: 200,
                color: Colors.cyanAccent[2 * 100],
              ),
            ),
          ),
          UnconstrainedBox(
            child: SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.2, 0))
                      .chain(CurveTween(curve: const Interval(0.4, 0.6)))),
              child: Container(
                height: 100,
                width: 200,
                color: Colors.cyanAccent[4 * 100],
              ),
            ),
          ),
          UnconstrainedBox(
            child: SlideTransition(
              position: _controller.drive(
                  Tween(begin: const Offset(0, 0), end: const Offset(0.2, 0))
                      .chain(CurveTween(curve: const Interval(0.6, 0.8)))),
              child: Container(
                height: 100,
                width: 200,
                color: Colors.cyanAccent[7 * 100],
              ),
            ),
          ),

          Center(
            child: OutlinedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const CustomAnimation();
              }));
            }, child: const Text('点击这里跳转到下一个界面')),
          ),
        ],
      ),
    );
  }
}
