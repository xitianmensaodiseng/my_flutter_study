import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWordsWiget extends StatefulWidget {
  const RandomWordsWiget({super.key});

  @override
  State<RandomWordsWiget> createState() => _RandomWordsWigetState();
}

class _RandomWordsWigetState extends State<RandomWordsWiget> {
  var wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Image(
              image: AssetImage('assets/Image/up.png'),
              color: Colors.cyanAccent,
            )),
            Text(wordPair.toString()),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('home');
                },
                icon: const Icon(
                  Icons.home,
                )),
            const SizedBox(), //中间位置空出
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('SecondRoutePage');
                },
                icon: const Icon(
                  Icons.business,
                )),
          ], //均分底部导航栏横向空间
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              wordPair = WordPair.random();
            });
          }),
    );
  }
}
