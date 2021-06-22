import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:resizrr/constants/filters.dart';
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resizrr/constants/colors.dart';

class SelectImageViewModel extends ChangeNotifier {
  late File selectedImage;
  Color _backgrounColor = BrandColors.black;
  double _imageSize = 300.0;
  final GlobalKey _screenshotKey = GlobalKey();
  File? get image => selectedImage;
  var _currentFilter = MyFilters.filters[0];
  double get imageSize => _imageSize;
  GlobalKey get screenShotKey => _screenshotKey;

  void setImage(File image) {
    selectedImage = image;
    notifyListeners();
  }

  void changeImageSize(double size) {
    _imageSize = size;
    notifyListeners();
  }

  get currentFilter => _currentFilter;

  void setNewFilter(filterMatrix) {
    _currentFilter = filterMatrix;
    notifyListeners();
  }

  void saveimage() {
    _convertImageToWidget();
  }

  void _convertImageToWidget() async {
    RenderRepaintBoundary boundaryImage = _screenshotKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image boxImage = await boundaryImage.toImage(pixelRatio: 2);
    ByteData? byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List byteImage = byteData!.buffer.asUint8List();
    _saveImage(byteImage);
  }

  void _saveImage(Uint8List byteImage) async {
    await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      final result = await ImageGallerySaver.saveImage(
        byteImage,
        quality: 100,
        name:
            // ignore: lines_longer_than_80_chars
            '${image!.path.substring(image!.path.lastIndexOf('/') + 1, image!.path.lastIndexOf('.'))}${Uuid().v1().substring(0, 1)}',
      );
    }
  }

  Color get backgroundColor => _backgrounColor;

  set imageBgColor(Color color) {
    _backgrounColor = color;
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
