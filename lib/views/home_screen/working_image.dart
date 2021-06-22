import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectImageViewModel>(
      builder: (context, imageViewModel, child) {
        return Container(
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       color: BrandColors.lightGrey,
          //       offset: Offset(-10, 10),
          //       blurRadius: 1,
          //     )
          //   ],
          // ),
          padding: const EdgeInsets.all(24.0),
          child: RepaintBoundary(
            key: imageViewModel.screenShotKey,
            child: Container(
              color: imageViewModel.backgroundColor,
              width: 432,
              height: 432,
              child: Center(
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix(imageViewModel.currentFilter),
                  child: Image.file(
                    imageViewModel.selectedImage,
                    width: imageViewModel.imageSize,
                    height: imageViewModel.imageSize,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
