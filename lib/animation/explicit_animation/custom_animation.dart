import 'package:flutter/material.dart';
import 'package:my_flutter_study/animation/explicit_animation/respirator.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({super.key});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
        title: const Text(
          'CustomAnimation万能的自定义动画',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Opacity(
                      opacity: _controller.value,
                      child: Container(
                        color: Colors.cyanAccent,
                        height: 100+_controller.value * 100,
                        width: 100+_controller.value * 100,
                        child: child
                      ),
                    );
                    },
                  child:IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  ),
            )),
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return const AespiratorPage();
                            }));
                          },
                          icon: const Icon(Icons.navigate_next)),
                      const Text('点击这里跳转呼吸器'),
                    ],
                  )))
        ],
      ),
    );
  }
}
