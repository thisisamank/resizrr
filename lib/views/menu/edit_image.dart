import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/constants/theme.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

class ImageEditingMenu extends StatefulWidget {
  const ImageEditingMenu({Key? key}) : super(key: key);

  @override
  _ImageEditingMenuState createState() => _ImageEditingMenuState();
}

// TODO: Migrate this file to Widget-View way
class _ImageEditingMenuState extends State<ImageEditingMenu> {
  bool showHueSlider = false;
  bool showBrightnessSlider = false;
  bool showSaturationSlider = false;

  void changeSaturationSlider() {
    setState(() => showSaturationSlider = !showSaturationSlider);
  }

  void changeBrightnessSlider() {
    setState(() => showBrightnessSlider = !showBrightnessSlider);
  }

  void changeHueSlider() {
    setState(() => showHueSlider = !showHueSlider);
  }

  @override
  Widget build(BuildContext context) {
    SelectImageViewModel imageViewModel =
        Provider.of<SelectImageViewModel>(context);
    return Expanded(child: getMenu(imageViewModel));
  }

  Widget getMenu(SelectImageViewModel imageViewModel) {
    if (showBrightnessSlider) {
      return _buildSlider(
        sliderLabel: 'Change Brightness',
        onChangeSlider: imageViewModel.setBrightness,
        onDoneSlider: changeBrightnessSlider,
        sliderValue: imageViewModel.imageBrightness,
      );
    } else if (showHueSlider) {
      return _buildSlider(
        sliderLabel: 'Change Hue',
        onChangeSlider: imageViewModel.setHue,
        onDoneSlider: changeHueSlider,
        sliderValue: imageViewModel.imageHue,
      );
    } else if (showSaturationSlider) {
      return _buildSlider(
        sliderLabel: 'Change Saturation',
        onChangeSlider: imageViewModel.setSaturation,
        onDoneSlider: changeSaturationSlider,
        sliderValue: imageViewModel.imageSaturation,
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCircularIcon(
                    icon: Icons.tonality,
                    onTap: changeBrightnessSlider,
                    label: 'Brightness',
                  ),
                  _buildCircularIcon(
                    icon: Icons.colorize,
                    onTap: changeHueSlider,
                    label: 'Hue',
                  ),
                  _buildCircularIcon(
                    icon: FontAwesome.lightbulb_o,
                    onTap: changeSaturationSlider,
                    label: 'Saturation',
                  ),
                  _buildCircularIcon(
                    icon: FontAwesome.crop,
                    onTap: () => cropImage(imageViewModel),
                    label: 'Transform',
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildCircularIcon({
    Function()? onTap,
    required IconData icon,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: BrandColors.adaptiveBorder(context)),
            ),
            child: IconButton(
              onPressed: onTap,
              icon: Icon(icon),
            ),
          ),
          Text(label)
        ],
      ),
    );
  }

  Widget _buildSlider({
    required String sliderLabel,
    required Function(double) onChangeSlider,
    required Function() onDoneSlider,
    required double sliderValue,
  }) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sliderLabel),
          Slider(
            // activeColor: BrandColors.black,
            // inactiveColor: BrandColors.lightGrey,
            value: sliderValue,
            onChanged: onChangeSlider,
          ),
          MaterialButton(
            onPressed: onDoneSlider,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: BrandColors.black,
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

void cropImage(SelectImageViewModel imageViewModel) async {
  File? croppedFile = await ImageCropper.cropImage(
    sourcePath: imageViewModel.image!.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    androidUiSettings: const AndroidUiSettings(
      toolbarTitle: 'Crop your image',
      toolbarColor: Colors.black,
      toolbarWidgetColor: Colors.white,
      initAspectRatio: CropAspectRatioPreset.original,
      lockAspectRatio: false,
    ),
    iosUiSettings: const IOSUiSettings(
      minimumAspectRatio: 1.0,
    ),
  );
  if (croppedFile != null) {
    imageViewModel.setCroppedImage(croppedFile);
  }
}
