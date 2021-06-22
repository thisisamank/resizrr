import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/routes/route_names.dart';
import 'package:resizrr/routes/router.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectImageViewModel(),
      child: ScreenUtilInit(
        designSize: const Size(414, 736),
        builder: () => const MaterialApp(
          onGenerateRoute: Routes.onGenerateRoute,
          onUnknownRoute: Routes.onUnknownRoute,
          initialRoute: RouteNames.selectImage,
        ),
      ),
    );
  }
}
