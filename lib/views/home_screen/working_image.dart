import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';
import 'package:resizrr/views/home_screen/filtered_image.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectImageViewModel>(
      builder: (context, imageViewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: RepaintBoundary(
                key: imageViewModel.screenShotKey,
                child: Container(
                  color: imageViewModel.backgroundColor,
                  constraints: const BoxConstraints(
                    minHeight: 360,
                    maxHeight: 360,
                    maxWidth: 360,
                    minWidth: 360,
                  ),
                  child: Center(
                    child: ImageFilter(
                      hue: imageViewModel.imageHue,
                      brightness: imageViewModel.imageBrightness,
                      saturation: imageViewModel.imageSaturation,
                      child: ColorFiltered(
                        colorFilter:
                            ColorFilter.matrix(imageViewModel.currentFilter),
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () => imageViewModel.selectImage(),
                child: const Text(
                  'Choose next Image',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
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
