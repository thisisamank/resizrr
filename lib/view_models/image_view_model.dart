import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class SelectImageViewModel extends ChangeNotifier {
  File? _selectedImage;

  File? get image => _selectedImage;

  void selectImage() async {
    final file = await FilePicker.platform.pickFiles();
    if (file != null) {
      _selectedImage = File(file.files.first.path!);

      notifyListeners();
    }
  }
}
