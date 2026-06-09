import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

class HomeWidgetTest extends StatefulWidget {
  const HomeWidgetTest({super.key});

  @override
  State<HomeWidgetTest> createState() => _HomeWidgetTestState();
}

class _HomeWidgetTestState extends State<HomeWidgetTest> {
  int counter = 0;

  // Home Widget Information
  String appGroupId = "group.homeScreenApp";
  String iOSWidgetName = "Investing101HomeWidget";
  String androidWidgetName = "Investing101HomeWidget";
  String dataKey = "text_from_flutter_app";

  @override
  void initState() {
    super.initState();

    // Initialize home widget with group id
    HomeWidget.setAppGroupId(appGroupId);
  }

  void _incrementCounter() async {
    setState(() {
      counter++;
    });

    // Save widget data
    String data = "Count is $counter";
    await HomeWidget.saveWidgetData(dataKey, data);

    // Update widget after data is saved
    await HomeWidget.updateWidget(
      iOSName: iOSWidgetName,
      androidName: androidWidgetName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$counter'),
          ElevatedButton(onPressed: _incrementCounter, child: Text('+')),
        ],
      ),
    );
  }
}
