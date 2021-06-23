import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resizrr/constants/colors.dart';
import 'package:resizrr/constants/filters.dart';
import 'package:resizrr/view_models/select_image/image_view_model.dart';

class FilterMenu extends StatelessWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectImageViewModel imageViewModel =
        Provider.of<SelectImageViewModel>(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 48),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24),
          //   child: Text(
          //     "Select Filter",
          //     style: TextStyle(fontSize: 16),
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: MyFilters.filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      imageViewModel.setNewFilter(MyFilters.filters[index]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // decoration: BoxDecoration(
                            //   boxShadow: [
                            //     BoxShadow(
                            //       color: BrandColors.lightGrey,
                            //       spreadRadius: 0.3,
                            //       offset: Offset(0, 16),
                            //       blurRadius: 13,
                            //     ),
                            //   ],
                            // ),
                            width: 100,
                            height: 100,
                            child: ColorFiltered(
                              colorFilter:
                                  ColorFilter.matrix(MyFilters.filters[index]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.file(imageViewModel.selectedImage),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
