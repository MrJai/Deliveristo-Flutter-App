import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';
import 'package:flutter_stacked_starter/ui/home/random_photo_viewmodel.dart';
import 'package:flutter_stacked_starter/utils/app_text.dart';
import 'package:flutter_stacked_starter/utils/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class RandomPhotoView extends StackedView<RandomPhotoViewModel> {
  final String breed;
  final List<String>? subBreedList;
  const RandomPhotoView({super.key, required this.breed, this.subBreedList});

  @override
  void onViewModelReady(RandomPhotoViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init(breed);
  }

  @override
  Widget builder(
      BuildContext context, RandomPhotoViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: viewModel.isBusy
          ? const SpinKitFoldingCube(
              color: AppColors.kcPrimaryColor,
            )
          : Column(
              children: [
                verticalSpaceMedium,
                Title(
                    color: Colors.black,
                    child: Text(
                      breed,
                      style: kManropeText.copyWith(fontSize: 22),
                    )),
                verticalSpaceMedium,
                Center(
                  child: CachedNetworkImage(
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
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.kcPrimaryColor,
                    ),
                    imageUrl: viewModel.photoModel?.message ?? defaultImage,
                  ),
                ),
                verticalSpaceMedium,
                if(subBreedList!.isNotEmpty)
                DropdownButton<String>(
                  hint: const Text('Select SubBreed',style: kManropeText,),
                  value: viewModel.dropDownSelectedItem,
                  items: subBreedList?.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (subBreed) => viewModel.setDropDownValueAndFetchPhoto(breed,subBreed),
                )
              ],
            ),
    );
  }

  @override
  RandomPhotoViewModel viewModelBuilder(BuildContext context) =>
      RandomPhotoViewModel();
}
