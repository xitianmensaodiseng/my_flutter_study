import 'package:flutter/material.dart';
import 'package:my_flutter_study/animation/explicit_animation/tween_and_curves.dart';

import '../implicit_animation/roll_counter.dart';

class RotationTransitionPage extends StatefulWidget {
  const RotationTransitionPage({super.key});

  @override
  State<RotationTransitionPage> createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RotationTransitionPage旋转动画的小部件',
          style: TextStyle(fontSize: 12),
        ),
      ),
      body: RotationTransition(
        turns:_controller,
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.cyanAccent,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _controller.repeat();
              });
            },
          ),
          TextButton(
            child: const Icon(Icons.navigate_next),
            onPressed: () {
              setState(() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const TweenAndCurves();
                }));
              });
            },
          ),
        ],
      ),
    );
  }


}
