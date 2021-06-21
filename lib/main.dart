import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/view_models/image_view_model.dart';
import 'package:resizrr/views/select_image/select_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: () => MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => SelectImageViewModel(),
          child: SelectImage(),
        ),
      ),
    );
  }
}
