import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:resizrr/constants/filters.dart';
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';

class SelectImageViewModel extends ChangeNotifier {
  late File selectedImage;
  Color _backgroundColor = Colors.white;
  double _imageSize = 300.0;
  double _brightness = 0.0;
  double _saturation = 0.0;
  double _hue = 0.0;
  final GlobalKey _screenshotKey = GlobalKey();
  var _currentFilter = MyFilters.filters[0];
  File? _croppedImage;
  bool _isBackgroundBlurEnabled = false;

  File? get image => selectedImage;
  Color get backgroundColor => _backgroundColor;
  File? get croppedImage => _croppedImage;
  double get imageSize => _imageSize;
  GlobalKey get screenShotKey => _screenshotKey;
  double get imageBrightness => _brightness;
  double get imageSaturation => _saturation;
  double get imageHue => _hue;
  bool get backgroundBlurStatus => _isBackgroundBlurEnabled;

  void setBrightness(double value) {
    _brightness = value;
    notifyListeners();
  }

  void changeBackgroundBlur() {
    _isBackgroundBlurEnabled = !_isBackgroundBlurEnabled;
    notifyListeners();
  }

  void reset() {
    _imageSize = 300;
    _brightness = 0;
    _saturation = 0;
    _hue = 0;
    _currentFilter = MyFilters.filters[0];
    _croppedImage = null;
    notifyListeners();
  }

  void setSaturation(double value) {
    _saturation = value;
    notifyListeners();
  }

  void setHue(double value) {
    _hue = value;
    notifyListeners();
  }

  void setCroppedImage(File? image) {
    _croppedImage = image;
    notifyListeners();
  }

  void changeImageSize(double size) {
    _imageSize = size;
    notifyListeners();
  }

  dynamic get currentFilter => _currentFilter;

  void setNewFilter(filterMatrix) {
    _currentFilter = filterMatrix;
    notifyListeners();
  }

  void saveimage() async {
    var image = await _convertImageToBytes();
    _saveImage(image);
  }

  void shareimage() async {
    final imgFile = await _takePicture();
    await Share.shareFiles([imgFile.path]);
    await imgFile.delete();
  }

  Future<File> _takePicture() async {
    var byteimage = await _convertImageToBytes();

    final directory = (await getApplicationDocumentsDirectory()).path;
    File imgFile = File('$directory/photo.png');
    await imgFile.writeAsBytes(byteimage);
    return imgFile;
  }

  Future<Uint8List> _convertImageToBytes() async {
    RenderRepaintBoundary boundaryImage = _screenshotKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image boxImage = await boundaryImage.toImage(pixelRatio: 3);
    ByteData? byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List byteImage = byteData!.buffer.asUint8List();
    return byteImage;
  }

  void _saveImage(Uint8List byteImage) async {
    await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      await ImageGallerySaver.saveImage(
        byteImage,
        quality: 100,
        name:
            // ignore: lines_longer_than_80_chars
            '${image!.path.substring(image!.path.lastIndexOf('/') + 1, image!.path.lastIndexOf('.'))}${const Uuid().v1().substring(0, 1)}',
      );
    }
  }

  set imageBgColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  Future<void> selectImage() async {
    final file = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowCompression: false,
      type: FileType.image,
      // onFileLoading: (FilePickerStatus status) {
      //   if (status == FilePickerStatus.picking) {
      //     return Center(
      //       child: CircularProgressIndicator(
      //         color: BrandColors.black,
      //       ),
      //     );
      //   }
      // },
    );
    if (file != null) {
      reset();
      selectedImage = File(file.files.first.path!);
      // setCroppedImage(File(file.files.first.path!));
    }
  }
}
