import 'package:flutter/material.dart';
import 'package:my_flutter_study/animation/implicit_animation/tween_animation_two.dart';
import 'package:my_flutter_study/page/home.dart';

class RollCounter extends StatefulWidget {
  const RollCounter({super.key});

  @override
  State<RollCounter> createState() => _RollCounterState();
}

class _RollCounterState extends State<RollCounter> {
  double count = 100;


  @override
  Widget build(BuildContext context) {

    double count1 = (count / 100); // count1 将包含小数部分 0.01
    double count2 = (count ~/ 10) % 10; // count2 将包含十位数字 0
    double count3 = count % 10; // count3 将包含百位和十位数字 1

    debugPrint("$count");
    debugPrint("$count1");
    debugPrint("$count2");
    debugPrint("$count3");


    return Scaffold(
      appBar: AppBar(
        title: const Text("综合应用Animation:计数器"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 50,
                width: 50,
                child: Counter(
                  count: count1,
                  duration: 1,
                )),
            SizedBox(
                height: 50,
                width: 50,
                child: Counter(
                  count: count2,
                  duration: 1,
                )),
            SizedBox(
                height: 50,
                width: 50,
                child: Counter(
                  count: count3,
                  duration: 1,
                )),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                count+=1;
                if(count3 >= 9){
                  count3=0;
                  ++count2;
                }
                if(count2 >= 9){
                  count2 = 0;
                  ++count1;
                }if(count1 >= 9){
                  count = 0;
                  count1 = 0;
                }

              });
            },
          ),
          TextButton(
            child: const Icon(Icons.navigate_next),
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FirstRoutePage();
                }));
              });
            },
          ),
        ],
      ),
    );
  }
}
