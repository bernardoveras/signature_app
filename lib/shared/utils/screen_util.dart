import 'package:flutter/material.dart';

class ScreenUtil {
  const ScreenUtil._();

  static Size size(BuildContext context) => MediaQuery.of(context).size;

  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;

  static double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
  static double bottomTop(BuildContext context) => MediaQuery.of(context).padding.top;
}