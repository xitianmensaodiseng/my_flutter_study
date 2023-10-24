import 'package:flutter/cupertino.dart';

class Counter extends StatelessWidget {
  Counter({super.key, required this.count, required this.duration});

  double count;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(end: count),
      duration: Duration(seconds: duration),
      builder: (BuildContext context, value, Widget? child) {
        final intCount = value ~/ 1;
        final decimals = value - intCount;
        return Stack(
          children: [
            Positioned(
                top: -5 * decimals * 10 ,
                child: Opacity(
                  opacity: 1.0 - decimals,
                  child: Text(
                    '$intCount',
                    style: const TextStyle(fontSize: 40),
                  ),
                )),
            Positioned(
                top: 35 - 4 * decimals * 10,
                child: Opacity(
                  opacity: decimals,
                  child: Text(
                    '${intCount + 1}',
                    style: const TextStyle(fontSize: 40),
                  ),
                )),
          ],
        );
      },
    );
  }
}
