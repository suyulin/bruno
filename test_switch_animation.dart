import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

void main() {
  runApp(SwitchAnimationTestApp());
}

class SwitchAnimationTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Animation Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwitchAnimationTestPage(),
    );
  }
}

class SwitchAnimationTestPage extends StatefulWidget {
  @override
  _SwitchAnimationTestPageState createState() =>
      _SwitchAnimationTestPageState();
}

class _SwitchAnimationTestPageState extends State<SwitchAnimationTestPage> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Switch 动画测试'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Switch 动画效果演示',
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              // 默认动画速度 (200ms)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '默认动画速度',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '200ms，平滑过渡',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
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
              ),
              SizedBox(height: 16),

              // 快速动画 (100ms)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '快速动画',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '100ms，快速响应',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
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
              ),
              SizedBox(height: 16),

              // 慢速动画 (500ms)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '慢速动画',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '500ms，缓慢优雅',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
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
              ),
              SizedBox(height: 16),

              // 大尺寸 Switch
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '大尺寸 Switch',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '80x40 大小，带动画',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    BrnSwitchButton(
                      value: switch4,
                      size: Size(80, 40),
                      animationDuration: Duration(milliseconds: 300),
                      onChanged: (value) {
                        setState(() {
                          switch4 = value;
                        });
                      },
                    ),
                  ],
                ),
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
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Text(
                  '✅ 平滑的拇指滑动动画\n'
                  '✅ 轨道颜色渐变动画\n'
                  '✅ 边框透明度动画\n'
                  '✅ 触摸时拇指缩放反馈\n'
                  '✅ 阴影效果增强立体感\n'
                  '✅ 可自定义动画时长\n'
                  '✅ 支持不同尺寸',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
              SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  onPressed: () {
                    setState(() {
                      switch1 = !switch1;
                      switch2 = !switch2;
                      switch3 = !switch3;
                      switch4 = !switch4;
                    });
                  },
                  child: Text('全部切换', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
