import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/constants/bg_colors.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

class BackgroundMenu extends StatelessWidget {
  const BackgroundMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectImageViewModel imageViewModel =
        Provider.of<SelectImageViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: backgroundColors.length + 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              imageViewModel.changeBackgroundBlur();
                            } else {
                              if (imageViewModel.backgroundBlurStatus) {
                                imageViewModel.changeBackgroundBlur();
                              }
                              imageViewModel.imageBgColor =
                                  backgroundColors[index - 1];
                            }
                          },
                          child: index == 0
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 3, sigmaY: 3),
                                      child: Image.file(
                                        imageViewModel.selectedImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: backgroundColors[index - 1],
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: BrandColors.adaptiveBorder(context)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      showColorPicker(context, imageViewModel);
                    },
                    icon: const Icon(Icons.colorize),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Change Image Size'),
          ),
          Slider(
            // activeColor: BrandColors.black,
            // inactiveColor: BrandColors.lightGrey,
            min: 300,
            max: 500,
            value: imageViewModel.imageSize,
            onChanged: imageViewModel.changeImageSize,
          )
        ],
      ),
    );
  }

  void showColorPicker(context, SelectImageViewModel selectImageViewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectImageViewModel.backgroundColor,
              onColorChanged: (color) =>
                  selectImageViewModel.imageBgColor = color,
              colorPickerWidth: 300.0,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              displayThumbColor: true,
              showLabel: true,
              paletteType: PaletteType.hsv,
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2.0),
                topRight: Radius.circular(2.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
