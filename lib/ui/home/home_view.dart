import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
const HomeView({super.key});

@override
Widget builder(
BuildContext context,
HomeViewModel viewModel,
Widget? child
) {
return Scaffold();
}
@override
HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}