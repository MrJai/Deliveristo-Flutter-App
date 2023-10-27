import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';
import 'package:flutter_stacked_starter/ui/random_photo/circular_image.dart';
import 'package:flutter_stacked_starter/ui/random_photo/random_photo_viewmodel.dart';
import 'package:flutter_stacked_starter/utils/app_loading.dart';
import 'package:flutter_stacked_starter/utils/app_text.dart';
import 'package:flutter_stacked_starter/utils/custom_appbar.dart';
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
      appBar: CustomAppBar(
        showLeading: true,
        title: breed,
        bgColor: AppColors.kcPrimaryColor,
        titleColor: Colors.white,
        height: 40.h,
        onBackPress: viewModel.back,
      ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.init(breed),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                verticalSpaceMedium,
                viewModel.isBusy
                    ? const AppLoading()
                    : CircularCachedNetworkImage(
                        imageUrl: viewModel.photoModel?.message,
                      ),
                verticalSpaceMedium,
                if (subBreedList!.isNotEmpty)
                  DropdownButton<String>(
                    hint: const Text(
                      'Select SubBreed',
                      style: kManropeText,
                    ),
                    value: viewModel.dropDownSelectedItem,
                    items: subBreedList?.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (subBreed) =>
                        viewModel.setDropDownValueAndFetchPhoto(breed, subBreed),
                  ),
                verticalSpaceMedium,
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.kcPrimaryColor)),
                    onPressed: () => viewModel.fetchImageList(
                        breed, viewModel.dropDownSelectedItem),
                    child: Text("${breed.toUpperCase()} IMAGE LIST",
                        style: kManropeText.copyWith(color: Colors.white))),
                verticalSpaceMedium,
                viewModel.busy('imageListBusy')
                    ? const AppLoading()
                    : SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.imageList.length,
                            itemBuilder: ((context, index) =>
                                CircularCachedNetworkImage(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.h),
                                    height: 80.h,
                                    width: 80.w,
                                    imageUrl: viewModel.imageList[index]))),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  RandomPhotoViewModel viewModelBuilder(BuildContext context) =>
      RandomPhotoViewModel();
}
