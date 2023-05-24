import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motomemo/components/mileage_add.dart';

class MileageCount extends StatefulWidget {
  const MileageCount({Key? key}) : super(key: key);

  @override
  State<MileageCount> createState() => _MileageCountState();
}

class _MileageCountState extends State<MileageCount> {
  late int _count = 0;
  final key = "count_key";
  late SharedPreferences prefs;

  void _readCount() async {
    //SharedPreferencesオブジェクトの取得
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      //端末に保存されているcountを取得する。なければ(null)0とする
      _count = prefs.getInt(key) ?? 0;
    });
  }

  void _setCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, _count);
  }

  @override
  void initState() {
    super.initState();
    _readCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('MotoMemo')),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Center(
              child: Column(children: [
            const Text('現在の走行距離'),
            Text(
              "${_count}km",
              style: const TextStyle(fontSize: 30),
            )
          ])),
          const Text('test'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var updatedCount = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return mileageAdd(count: _count);
            }),
          );
          setState(() {
            _count = updatedCount ?? _count;
            _setCount();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
