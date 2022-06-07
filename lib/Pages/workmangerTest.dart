import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

const String TAG = "BackGround_Work";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: false // This should be false
  );
  runApp(WorkmagetTest());
}

class WorkmagetTest extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BackGround Work Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackGroundWorkSample(),
    );
  }
}

class BackGroundWorkSample extends StatefulWidget {

  @override
  _BackGroundWorkSampleState createState() => _BackGroundWorkSampleState();
}

class _BackGroundWorkSampleState extends State<BackGroundWorkSample> {
  int _counterValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //This task runs periodically
    //It will wait at least 10 seconds before its first launch
    //Since we have not provided a frequency it will be the default 15 minutes
    Workmanager().registerPeriodicTask(
      TAG,
      "simplePeriodicTask",
      initialDelay: Duration(seconds: 5),
    );
    loalData();
  }

  void loalData() async {
    _counterValue =
    await BackGroundWork.instance._getBackGroundCounterValue();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BackGround Work Sample'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Counter Value: ${_counterValue}"),
              RaisedButton(onPressed: () {
                loalData();
              }, child: Text("Fetch Current Counter Value"),)
            ],
          ),
        ));
  }
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print(TAG + "callbackDispatcher");
    int value =
    await BackGroundWork.instance._getBackGroundCounterValue();
    BackGroundWork.instance._loadCounterValue(value + 1);
    return Future.value(true);
  });
}

class BackGroundWork {
  BackGroundWork._privateConstructor();

  static final BackGroundWork _instance =
  BackGroundWork._privateConstructor();

  static BackGroundWork get instance => _instance;

  _loadCounterValue(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('BackGroundCounterValue', value);
  }

  Future<int> _getBackGroundCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    int counterValue = prefs.getInt('BackGroundCounterValue') ?? 0;
    return counterValue;
  }
}