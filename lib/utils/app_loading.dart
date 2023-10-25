import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';


class AppLoading extends StatelessWidget {
  final Color color;
  const AppLoading({super.key, this.color = AppColors.kcPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color));
  }
}
