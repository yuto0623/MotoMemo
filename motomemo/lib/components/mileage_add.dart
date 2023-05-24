import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mileageAdd extends StatefulWidget {
  final int count;

  const mileageAdd({Key? key, required this.count}) : super(key: key);

  @override
  State<mileageAdd> createState() => _mileageAddState();
}

class _mileageAddState extends State<mileageAdd> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.count; // 初期値を設定
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('走行距離の入力')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("${count}km"),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(hintText: widget.count.toString()),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) => count = int.parse(value),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, count);
              },
              child: Text('保存する')),
          const SizedBox(
            height: 70,
          ),
        ]),
      ),
    );
  }
}
