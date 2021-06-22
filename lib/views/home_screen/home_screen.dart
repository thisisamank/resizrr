import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';
import 'package:resizrr/views/home_screen/working_image.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<SelectImageViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: BrandColors.black,
        ),
        actions: [
          IconButton(
              onPressed: () async => imageViewModel.saveimage(),
              icon: const Icon(Icons.save))
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            ShowImage(),
          ],
        ),
      ),
    );
  }
}
