import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'hero_page_two.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // timeDilation = 5.0;
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
        title: const Text('HeroPage'),
      ),
      body: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (c){
            return const HeroPageTwo();
          }));
        },
        child: const Hero(tag: 'time',
        child: Icon(Icons.safety_check)),
      ),
    );
  }
}
