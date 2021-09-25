import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';
import 'package:resizrr/views/home_screen/filtered_image.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<SelectImageViewModel>(
      builder: (context, imageViewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: RepaintBoundary(
                key: imageViewModel.screenShotKey,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    color: imageViewModel.backgroundColor,
                    child: Stack(
                      children: [
                        imageViewModel.backgroundBlurStatus
                            ? Image.file(
                                imageViewModel.croppedImage ??
                                    imageViewModel.selectedImage,
                                width: size.width,
                                height: size.width,
                                fit: BoxFit.cover,
                              )
                            : Container(),
                        imageViewModel.backgroundBlurStatus
                            ? BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 3,
                                    sigmaY: 3,
                                    tileMode: TileMode.decal),
                                child: Container(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                              )
                            : Container(),
                        Center(
                          child: appImageFilter(
                            hue: imageViewModel.imageHue,
                            brightness: imageViewModel.imageBrightness,
                            saturation: imageViewModel.imageSaturation,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.matrix(
                                  imageViewModel.currentFilter),
                              child: Image.file(
                                imageViewModel.croppedImage ??
                                    imageViewModel.selectedImage,
                                width: imageViewModel.imageSize,
                                height: imageViewModel.imageSize,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextButton(
                //onTap: () => imageViewModel.selectImage(),
                onPressed: () => imageViewModel.selectImage(),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft),
                child: const Text(
                  'Choose next Image',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    //decorationColor: Colors.black,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
