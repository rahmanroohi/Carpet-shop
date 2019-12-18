import 'dart:async';

import 'package:carpet_store/SizeConfig.dart';
import 'package:carpet_store/screen/Master.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
        height: SizeConfig.blockSizeVertical * 100,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Stack(
          children: <Widget>[
            Container(
                height: SizeConfig.blockSizeVertical * 100,
                width: SizeConfig.blockSizeHorizontal * 100,
                child: Image.asset(
                  'assets/image/group/tmp1.jpg',
                  fit: BoxFit.cover,
                )),
            Center(child: CircularProgressIndicator())
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => M_start()),
            ));
  }
}
