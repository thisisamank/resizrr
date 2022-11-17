import 'dart:ui';

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
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border(
                                    bottom: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? BrandColors.lightGrey
                                            : BrandColors.lightGreen),
                                    top: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? BrandColors.lightGrey
                                            : BrandColors.lightGreen),
                                    left: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? BrandColors.lightGrey
                                            : BrandColors.lightGreen),
                                    right: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? BrandColors.lightGrey
                                            : BrandColors.lightGreen),
                                  )),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(
                                  MyFilters.filters[index],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(
                                    imageViewModel.selectedImage,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
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
