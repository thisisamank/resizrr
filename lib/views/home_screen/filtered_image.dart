import 'package:flutter/material.dart';
import 'package:resizrr/utils/color_filter.dart';

Widget appImageFilter(
    {double brightness = 0, double saturation = 0, double hue = 0, child}) {
  return ColorFiltered(
    colorFilter: ColorFilter.matrix(ColorFilterGenerator.brightnessAdjustMatrix(
      value: brightness,
    )),
    child: ColorFiltered(
        colorFilter:
            ColorFilter.matrix(ColorFilterGenerator.saturationAdjustMatrix(
          value: saturation,
        )),
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(ColorFilterGenerator.hueAdjustMatrix(
            value: hue,
          )),
          child: child,
        )),
  );
}
