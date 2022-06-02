import 'package:flutter/material.dart';

import '../../../product/utils/material_color.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.iconData}) : super(key: key);
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: AppColors.marvelRed,
      size: 25,
    );
  }
}
