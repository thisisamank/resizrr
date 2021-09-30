import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/routes/route_names.dart';
import 'package:resizrr/routes/router.dart';
import 'package:resizrr/utils/app_pref.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

import 'constants/theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

final isDarkTheme = ValueNotifier<bool>(false);

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    AppPreference.instance.getTheme(Themes.KEY).then((prefTheme) {
      print(prefTheme);
      isDarkTheme.value = prefTheme == Themes.system
          ? WidgetsBinding.instance?.window.platformBrightness ==
              Brightness.dark
          : prefTheme == Themes.dark;
    });

    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).brightness == Brightness.dark
              ? BrandColors.black
              : BrandColors.black,
          statusBarBrightness: Theme.of(context).brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark),
    );
    return ChangeNotifierProvider(
      create: (context) => SelectImageViewModel(),
      child: ScreenUtilInit(
        designSize: const Size(414, 736),
        builder: () => ValueListenableBuilder(
          valueListenable: isDarkTheme,
          builder: (BuildContext context, bool isDarkMode, Widget? child) =>
              MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: BrandTheme.lightTheme,
            darkTheme: BrandTheme.darkTheme,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: Routes.onGenerateRoute,
            onUnknownRoute: Routes.onUnknownRoute,
            initialRoute: RouteNames.selectImage,
          ),
        ),
      ),
    );
  }

  @override
  void didChangePlatformBrightness() {
    final isDark =
        WidgetsBinding.instance?.window.platformBrightness == Brightness.dark;
    isDarkTheme.value = isDark;
    AppPreference.instance
        .setTheme(Themes.KEY, isDark ? Themes.dark : Themes.light);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).brightness == Brightness.dark
              ? BrandColors.black
              : BrandColors.lightGrey,
          statusBarBrightness: Theme.of(context).brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark),
    );
    super.didChangePlatformBrightness();
  }
}
