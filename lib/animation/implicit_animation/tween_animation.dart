import 'package:flutter/material.dart';
import 'package:my_flutter_study/animation/implicit_animation/roll_counter.dart';

class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({super.key});

  @override
  State<TweenAnimationPage> createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage> {
  double TweeAnimationEnd = 98;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TweeAnimationn补间动画"),),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 88,end: TweeAnimationEnd),
          duration: const Duration(seconds: 2),
          builder: (BuildContext context, value, Widget? child) {
            return Container(
              height: 300,
              width: 300,
              color: Colors.cyanAccent,
              child: Center(child: Text ("注意这里文字的变化",style: TextStyle(fontSize: value), )),
            );
          },
        ),
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {

                TweeAnimationEnd-=10;

                if(TweeAnimationEnd <=30){
                  TweeAnimationEnd=88;
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
                  return const RollCounter();
                }));
              });
            },
          ),

        ],
      ),
    );
  }
}
