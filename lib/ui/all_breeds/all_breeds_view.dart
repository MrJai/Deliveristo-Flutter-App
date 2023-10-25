import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/all_breeds/all_breeds_viewmodel.dart';
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
BuildContext context,
AllBreedsViewModel viewModel,
Widget? child
) {
return Scaffold(
  body: ListView.builder(itemBuilder: ((context, index) => const ListTile())),
);
}
@override
AllBreedsViewModel viewModelBuilder(BuildContext context) => AllBreedsViewModel();
}