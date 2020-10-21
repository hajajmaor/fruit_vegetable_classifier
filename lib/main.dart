import 'dart:io';
import 'package:fruit_vegetable_classifier/service/image_classify_service.dart';
import 'package:fruit_vegetable_classifier/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ImageClassifyService>(
      create: (context) => ImageClassifyService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return CupertinoApp(
        home: MySplashScreen(),
        debugShowCheckedModeBanner: false,
        title: dAppName,
      );
    else
      return MaterialApp(
        title: dAppName,
        home: MySplashScreen(),
        debugShowCheckedModeBanner: false,
      );
  }
}
