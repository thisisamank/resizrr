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
        return RepaintBoundary(
          key: imageViewModel.screenShotKey,
          child: Container(
            color: imageViewModel.backgroundColor,
            width: 414.w,
            height: 414.w,
            child: Image.file(imageViewModel.selectedImage),
          ),
        );
      },
    );
  }
}
