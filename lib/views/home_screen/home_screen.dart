import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<SelectImageViewModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.file(
              imageViewModel.image!,
              width: 414.w,
              height: 414.h,
            ),
          ],
        ),
      ),
    );
  }
}
