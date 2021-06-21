import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/view_models/image_view_model.dart';

class SelectImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Provider.of<SelectImageViewModel>(context, listen: false)
                    .selectImage();
              },
              child: Container(
                color: BrandColors.lightGreen,
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(327),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/folder.svg',
                    height: ScreenUtil().setHeight(80),
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
