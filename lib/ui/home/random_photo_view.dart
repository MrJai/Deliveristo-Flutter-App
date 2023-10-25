import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';
import 'package:flutter_stacked_starter/ui/home/random_photo_viewmodel.dart';
import 'package:flutter_stacked_starter/utils/app_text.dart';
import 'package:stacked/stacked.dart';

class RandomPhotoView extends StackedView<RandomPhotoViewModel> {
  const RandomPhotoView({super.key});

  @override
  void onViewModelReady(RandomPhotoViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(
      BuildContext context, RandomPhotoViewModel viewModel, Widget? child) {
    return Scaffold(
      body: viewModel.isBusy
          ? const SpinKitFoldingCube(color: AppColors.kcPrimaryColor,)
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    width: 250.w,
                    height: 250.h,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error,color: AppColors.kcPrimaryColor,),
                    imageUrl: viewModel.photoModel?.message ?? defaultImage,
                  ),
                  SizedBox(
                    width: 250.w,
                    height: 30.h,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          viewModel.init();
                        },
                        icon: const Icon(
                          Icons.keyboard_double_arrow_right_rounded,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Fetch Random Picture",
                          style: kManropeText.copyWith(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
    );
  }

  @override
  RandomPhotoViewModel viewModelBuilder(BuildContext context) =>
      RandomPhotoViewModel();
}
