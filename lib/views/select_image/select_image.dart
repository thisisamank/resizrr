import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/routes/route_names.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectImageViewModel = Provider.of<SelectImageViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () async {
                await selectImageViewModel.selectImage();
                if (selectImageViewModel.image != null) {
                  await Navigator.pushNamed(context, RouteNames.homeScreen);
                }
              },
              child: DottedBorder(
                color: BrandColors.green,
                borderType: BorderType.Rect,
                dashPattern: const [24, 8],
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
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: BrandColors.green.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(8, 8),
              ),
            ]),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 19.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.h),
              ),
              onPressed: () async {
                await selectImageViewModel.selectImage();
                if (selectImageViewModel.image != null) {
                  await Navigator.pushNamed(context, RouteNames.homeScreen);
                }
              },
              color: BrandColors.green,
              child: const Text(
                'Select your file!',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Made with ❤ by '),
                GestureDetector(
                  onTap: () => launch('https://github.com/thisisamank'),
                  child: const Text(
                    'Aman',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Text('  & '),
                GestureDetector(
                  onTap: () => launch('https://csspoint101.com'),
                  child: const Text(
                    'Jatin.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
