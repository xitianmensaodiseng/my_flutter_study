import 'package:flutter/material.dart';

import 'hero_page.dart';

class AespiratorPage extends StatefulWidget {
  const AespiratorPage({super.key});

  @override
  State<AespiratorPage> createState() => _AespiratorPageState();
}

class _AespiratorPageState extends State<AespiratorPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation stopAnimation = Tween<double>(begin: 0, end: 1.0)
        .chain(CurveTween(curve: const Interval(0.0, 0.2)))
        .animate(_controller);
    Animation overAnimation = Tween<double>(begin: 1.0, end: 0)
        .chain(CurveTween(curve: const Interval(0.55, 0.95)))
        .animate(_controller);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aspirator呼吸器实例',
        ),
      ),
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Stack(children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipOval(
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {

                    return Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.cyanAccent,
                        gradient: RadialGradient(
                          colors: const [
                            Color(0xFF84FFFF),
                            Color(0xFF00B8D4),
                          ],
                          stops: _controller.value <= 0.2
                              ? [stopAnimation.value, stopAnimation.value + 0.1]
                              : [
                                  overAnimation.value,
                                  overAnimation.value + 0.1
                                ],
                        ),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child: Column(
                children: [
                  ScaleTransition(
                    scale: Tween<double>(begin: 0, end: 1)
                        .chain(CurveTween(
                            curve: const Interval(
                          0,
                          1,
                        )))
                        .animate(_controller),
                    child: Opacity(
                      opacity: 1,
                      child: ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.cyanAccent,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (c){
                          return const HeroPage();
                        }));
                      },
                      icon: const Icon(Icons.navigate_next)),
                  const Text('点击这里跳转HeroPage页面'),
                ],
              )))
        ],
      ),
    );
  }
}
