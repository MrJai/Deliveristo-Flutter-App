import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';


class AppLoading extends StatelessWidget {
  final Color color;
  final double? height;
  final double? width;
  const AppLoading({super.key, this.color = AppColors.kcPrimaryColor, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(
              width: width ??  250.w,
              height: height ?? 250.h,
              child: const SpinKitFoldingCube(
                  color: AppColors.kcPrimaryColor,
                ),
            ));
  }
}
