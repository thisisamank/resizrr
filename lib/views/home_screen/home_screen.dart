import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';
import 'package:resizrr/views/home_screen/working_image.dart';
import 'package:resizrr/views/menu/change_background.dart';
import 'package:resizrr/views/menu/edit_image.dart';
import 'package:resizrr/views/menu/filter_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int imageMenuIndex = 0;

  void _changeMenu(int index) {
    setState(() => imageMenuIndex = index);
  }

  final List<Widget> _widgetOptions = [
    const ImageEditingMenu(),
    const FilterMenu(),
    const BackgroundMenu(),
  ];
  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<SelectImageViewModel>(context);
    final snackBar = SnackBar(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      behavior: SnackBarBehavior.floating,
      // backgroundColor: AppTheme.toastBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Icon(
            AntDesign.checkcircle,
            size: 30,
            color: BrandColors.green,
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Text(
              'Image saved 😎',
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeMenu,
        currentIndex: imageMenuIndex,
       // selectedItemColor: BrandColors.black,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.edit_2,
              size: 18.sp,
            ),
            label: 'Edit Image',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Feather.sliders,
                size: 18.sp,
              ),
              label: 'Image Filters'),
          BottomNavigationBarItem(
              icon: Icon(
                Feather.maximize,
                size: 18.sp,
              ),
              label: 'Backgrounds'),
        ],
      ),
      appBar: AppBar(
        //backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(
        //   color: BrandColors.black,
        // ),
        actions: [
          IconButton(
              onPressed: () async {
                await HapticFeedback.vibrate();
                imageViewModel.saveimage();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Feather.download))
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ShowImage(),
            Container(),
            _widgetOptions.elementAt(imageMenuIndex),
            Container(),
          ],
        ),
      ),
    );
  }
}
