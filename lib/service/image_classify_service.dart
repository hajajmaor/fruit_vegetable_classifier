import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ImageClassifyService extends ChangeNotifier {
  ImageClassifyService() {
    loadModel();
  }

  File image;
  //each item in _output is a Map : keys(index,label,confidence)
  List output;
  final _picker = ImagePicker();

  Future loadModel() async {
    await Tflite.loadModel(
      model: 'assets/tflite/model.tflite',
      labels: 'assets/tflite/labels.txt',
    );
  }

  Future pickImage() async {
    var _image = await _picker.getImage(
      source: ImageSource.camera,
    );
    if (_image == null) return null;

    this.image = File(_image.path);

    classifyImage(this.image);
  }

  Future pickGalleryImage() async {
    var _image = await _picker.getImage(
      source: ImageSource.gallery,
    );
    if (_image == null) return null;

    this.image = File(_image.path);

    classifyImage(this.image);
  }

  Future classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageStd: 127.5,
      imageMean: 127.5,
    );
    if (output.isNotEmpty) {
      this.output = output;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
