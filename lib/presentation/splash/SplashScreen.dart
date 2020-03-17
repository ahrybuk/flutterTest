import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<StatefulWidget> {
  Timer _timer;
  final Duration _splashDuration = Duration(seconds: 5);
  final Duration _loadingTextUpdatePeriod = Duration(milliseconds: 300);
  var _rawLoadingText = "Loading";
  var _loadingText = "";

  SplashScreenState() {
    this._timer = Timer(_splashDuration, () {
//    TODO navigate next
    });
  }

  void _updateLoadingText() {
    if (_timer.isActive) {
      Future.delayed(_loadingTextUpdatePeriod, () {
        setState(() {
          _loadingText = _getUpdatedLoadingText();
        });
        _updateLoadingText();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _updateLoadingText();
  }

  String _getUpdatedLoadingText() {
    switch (_loadingText.length) {
      case 7:
        return _rawLoadingText + ".";
      case 8:
        return _rawLoadingText + "..";
      case 9:
        return _rawLoadingText + "...";
      default:
        return _rawLoadingText.substring(0, 7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Project")),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "This is a splash screen",
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark, fontSize: 20),
            ),
          ),
          Positioned(
            bottom: 36,
            right: 24,
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              child: Text(
                _loadingText,
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
