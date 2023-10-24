import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ListTile(title:Text("字母列表头")),
          Expanded(
            child: ListView(
              itemExtent: 300,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Scrollbar( // 显示进度条
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        //动态创建一个List<Widget>
                        children: str.split("")
                        //每一个字母都用一个Text显示,字体为原来的两倍
                            .map((c) => Text(c, textScaleFactor: 2.0,))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: 30,
          //   child: ListView.builder(
          //       itemCount: 100,
          //       itemExtent: 30.0, //强制高度为50.0
          //       itemBuilder: (BuildContext context, int index) {
          //         return ListTile(title: Text("$index"));
          //       }
          //   ),
          // ),
        ],
      ),
    );
  }
}
