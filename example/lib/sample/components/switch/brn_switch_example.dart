import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class BrnSwitchButtonExample extends StatefulWidget {
  @override
  _BrnSwitchButtonExampleState createState() => _BrnSwitchButtonExampleState();
}

class _BrnSwitchButtonExampleState extends State<BrnSwitchButtonExample> {
  bool value1 = true;
  bool value2 = true;
  bool value3 = false;
  bool value4 = false;
  bool value5 = true;
  bool value6 = false;
  bool value7 = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BrnAppBar(
        title: '开关元件',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '规则',
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            BrnBubbleText(maxLines: 3, text: '具备选中、未选中、以及禁用状态，支持自定义动画效果'),
            Text(
              '正常案例（默认动画）',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrnSwitchButton(
                value: value1,
                onChanged: (value) {
                  setState(() {
                    value1 = value;
                  });
                },
              ),
            ),
            Text(
              '快速动画 (100ms)',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrnSwitchButton(
                value: value6,
                animationDuration: Duration(milliseconds: 100),
                onChanged: (value) {
                  setState(() {
                    value6 = value;
                  });
                },
              ),
            ),
            Text(
              '慢速动画 (500ms)',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrnSwitchButton(
                value: value7,
                animationDuration: Duration(milliseconds: 500),
                onChanged: (value) {
                  setState(() {
                    value7 = value;
                  });
                },
              ),
            ),
            Text(
              '禁用案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrnSwitchButton(
                enabled: false,
                value: value2,
                onChanged: (value) {
                  setState(() {
                    value2 = value;
                  });
                },
              ),
            ),
            Text(
              '未选案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrnSwitchButton(
                value: value3,
                onChanged: (value) {
                  setState(() {
                    value3 = value;
                  });
                },
              ),
            ),
            Text(
              '禁用案例（无动画）',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrnSwitchButton(
                enabled: false,
                value: false,
                onChanged: (value) {},
              ),
            ),
            Text(
              '自定义大小（带动画）',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BrnSwitchButton(
                size: Size(80, 40),
                value: value5,
                onChanged: (value) {
                  setState(() {
                    value5 = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
