import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stacked_starter/constants/constants.dart';
import 'package:flutter_stacked_starter/ui/all_breeds/all_breeds_viewmodel.dart';
import 'package:flutter_stacked_starter/utils/app_text.dart';
import 'package:flutter_stacked_starter/utils/custom_appbar.dart';
import 'package:stacked/stacked.dart';

class AllBreedsView extends StackedView<AllBreedsViewModel> {
  const AllBreedsView({super.key});

  @override
  void onViewModelReady(AllBreedsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.init();
  }

  @override
  Widget builder(
      BuildContext context, AllBreedsViewModel viewModel, Widget? child) {
    return  Scaffold(
        appBar:  CustomAppBar(
          showLeading: false,
          title: 'Dog Breeds',
          bgColor: AppColors.kcPrimaryColor,
          titleColor: Colors.white,
          height: 40.h,
        ),
          body: viewModel.isBusy
              ? const SpinKitChasingDots(
                  color: AppColors.kcPrimaryColor,
                )
              : RefreshIndicator(
                onRefresh: viewModel.init,
                child: ListView.builder(
                    itemCount: viewModel.allBreedsModel?.message.length,
                    itemBuilder: (BuildContext context, int index) {
                      final breed =
                          viewModel.allBreedsModel?.message.keys.elementAt(index);
                      final subBreedList = viewModel.allBreedsModel?.message[breed];
                      return GestureDetector(
                        onTap: () => viewModel.navigateToRandomPhotoByBreed(breed,subBreedList),
                        child: ListTile(
                          title: Text(breed!),
                          subtitle: subBreedList!.isNotEmpty
                              ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: subBreedList
                                        .asMap()
                                        .entries
                                        .map(
                                          (entry) => Text(
                                              entry.value +
                                                  (entry.key ==
                                                          subBreedList.length - 1
                                                      ? ''
                                                      : ','),
                                              style: kManropeText),
                                        )
                                        .toList(),
                                  )
                              : null,
                        ),
                      );
                    }),
              ),
    );
  }

  @override
  AllBreedsViewModel viewModelBuilder(BuildContext context) =>
      AllBreedsViewModel();
}
