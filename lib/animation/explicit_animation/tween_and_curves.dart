import 'package:flutter/material.dart';

import 'interleaved_animation.dart';

class TweenAndCurves extends StatefulWidget {
  const TweenAndCurves({super.key});

  @override
  State<TweenAndCurves> createState() => _TweenAndCurvesState();
}

class _TweenAndCurvesState extends State<TweenAndCurves>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
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
        title: const Text(
          '控制器串联补间（Tween）和曲线（curves）',
          style: TextStyle(fontSize: 12),
        ),
      ),
      body: ListView(
        children: [
          const Center(child: Text('这里主要是展示显式动画结合补间动画和曲线的用法')),
          Padding(
            padding: const EdgeInsets.all(100),
            child: UnconstrainedBox(
              child: ScaleTransition(
                // scale: Tween<double>(begin: 0.5, end: 1).animate(_controller),

                //这里两个写法效果都是一样，注意Tween(begin: 0.5,end: 1).animate(_controller),
                // 它是Animation<num>，但这里需要的是Animation<double>

                //所以写法有两种：1，scale: Tween(begin: 0.5,end: 1.0).animate(_controller),
                // 2,scale: Tween<double>(begin: 0.5,end: 1).animate(_controller),

                //下面这种也可以达到同样的效果
                scale: _controller.drive(Tween<double>(begin: 0.5, end: 1)
                    .chain(CurveTween(curve: Curves.bounceOut))),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.cyanAccent,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(100),
            child: UnconstrainedBox(
              child: SlideTransition(
                //这个控件是控制偏移的
                position: Tween(
                        begin: const Offset(0, -1), //Offset(x,y)
                        end: const Offset(0, 0.2))
                    .chain(CurveTween(
                        curve: Curves.bounceOut)) //这种写法就可以叠加其效果，例如曲线线性
                    .animate(_controller), //这里需要一个Animation<Offset> position,类型
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Center(
            child: OutlinedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const InterleavedAnimation();
              }));
            }, child: const Text('点击这里跳转到下一个界面')),
          ),
        ],
      ),
    );

  }
}
