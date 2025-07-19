import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class AnimatedSwitchTest extends StatefulWidget {
  @override
  _AnimatedSwitchTestState createState() => _AnimatedSwitchTestState();
}

class _AnimatedSwitchTestState extends State<AnimatedSwitchTest> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BrnAppBar(
        title: 'Switch 动画测试',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '动画效果测试',
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // 默认动画速度 (200ms)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '默认动画 (200ms)',
                    style: TextStyle(fontSize: 18),
                  ),
                  BrnSwitchButton(
                    value: switch1,
                    onChanged: (value) {
                      setState(() {
                        switch1 = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // 快速动画 (100ms)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '快速动画 (100ms)',
                    style: TextStyle(fontSize: 18),
                  ),
                  BrnSwitchButton(
                    value: switch2,
                    animationDuration: Duration(milliseconds: 100),
                    onChanged: (value) {
                      setState(() {
                        switch2 = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // 慢速动画 (500ms)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '慢速动画 (500ms)',
                    style: TextStyle(fontSize: 18),
                  ),
                  BrnSwitchButton(
                    value: switch3,
                    animationDuration: Duration(milliseconds: 500),
                    onChanged: (value) {
                      setState(() {
                        switch3 = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),

              Text(
                '动画特性：',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• 拇指滑动动画\n'
                '• 轨道颜色渐变动画\n'
                '• 边框透明度动画\n'
                '• 阴影效果\n'
                '• 可自定义动画时长',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      switch1 = !switch1;
                      switch2 = !switch2;
                      switch3 = !switch3;
                    });
                  },
                  child: Text('全部切换'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
