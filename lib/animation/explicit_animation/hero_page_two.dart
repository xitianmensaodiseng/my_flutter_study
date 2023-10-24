import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPageTwo extends StatefulWidget {
  const HeroPageTwo({super.key});

  @override
  State<HeroPageTwo> createState() => _HeroPageTwoState();
}

class _HeroPageTwoState extends State<HeroPageTwo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
        title: const Text('HeroPageTwo'),
      ),
      body: const Center(
          child: Column(
            children: [
              Hero(
                tag: 'time',
                child: FlutterLogo(
                  size: 500,
                ),
              ),
              Text(
                '这是一个hero动画跳转子界面，用以展示hero动画效果',
                style: TextStyle(fontSize: 20),
              ),
            ],
          )),
    );
  }
}
