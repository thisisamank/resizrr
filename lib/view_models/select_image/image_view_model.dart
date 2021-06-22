import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class SelectImageViewModel extends ChangeNotifier {
  late File selectedImage;

  File? get image => selectedImage;
  void setImage(File image) {
    selectedImage = image;
    notifyListeners();
  }

  Future<void> selectImage() async {
    final file = await FilePicker.platform.pickFiles();
    if (file != null) {
      selectedImage = File(file.files.first.path!);
      setImage(File(file.files.first.path!));
    }
  }
}
