import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;

  const AppLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitCircle(
      color: color ?? AppColors.mainAppColor,
      size: 25.r,
    ));
  }
}
