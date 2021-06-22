import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';
import 'package:resizrr/views/home_screen/working_image.dart';
import 'package:resizrr/views/menu/change_background.dart';

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
    BackgroundMenu(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<SelectImageViewModel>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeMenu,
        currentIndex: imageMenuIndex,
        selectedItemColor: BrandColors.black,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Edit Image',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.equalizer), label: 'Image Filters'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.maximize_outlined), label: 'Backgrounds'),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: BrandColors.black,
        ),
        actions: [
          IconButton(
              onPressed: () async => imageViewModel.saveimage(),
              icon: const Icon(Icons.file_download))
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            ShowImage(),
            _widgetOptions.elementAt(imageMenuIndex),
          ],
        ),
      ),
    );
  }
}
