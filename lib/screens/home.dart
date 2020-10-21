import 'dart:io';

import 'package:fruit_vegetable_classifier/constants.dart';
import 'package:fruit_vegetable_classifier/service/image_classify_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final backgroudColor = Colors.black87;
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return CupertinoPageScaffold(
        backgroundColor: backgroudColor,
        child: HomeBody(),
      );
    else
      return Scaffold(
        backgroundColor: backgroudColor,
        body: HomeBody(),
      );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _imageService = Provider.of<ImageClassifyService>(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: dLinerGred,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Detect Fruit or Vegetable',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Custom TensorFlow CNN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Consumer<ImageClassifyService>(
                          builder: (_, value, __) {
                            if (value.image == null || value.output == null) {
                              return Column(
                                children: [
                                  Image.asset(dAppPhots),
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              );
                            } else if (value.output != null) {
                              return Column(
                                children: [
                                  Container(
                                    height: 300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        value.image,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${value.output[0]['label']}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              );
                            } else
                              return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        color: Colors.transparent,
                        onPressed: _imageService.pickGalleryImage,
                        child: Text(
                          'Choose a photo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        color: Colors.transparent,
                        onPressed: _imageService.pickImage,
                        child: Text(
                          'Camera Roll',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
