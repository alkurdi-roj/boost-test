
import 'package:boost_test/view/recources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgPictureWidget
 extends StatelessWidget {

  final double? height;
  final double? width;
  final String assetsName;
  const SvgPictureWidget
  (
      {super.key,
      required this.assetsName, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetsName,
      height: height,
      fit: BoxFit.scaleDown,
      width: width,
    );
  }
}
