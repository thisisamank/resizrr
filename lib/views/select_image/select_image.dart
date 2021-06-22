import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/routes/route_names.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

class SelectImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectImageViewModel = Provider.of<SelectImageViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                await selectImageViewModel.selectImage();
                if (selectImageViewModel.image != null) {
                  await Navigator.pushNamed(context, RouteNames.homeScreen);
                }
              },
              child: Container(
                color: BrandColors.lightGreen,
                width: 300.w,
                height: 327.h,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/folder.svg',
                    height: 80.h,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
