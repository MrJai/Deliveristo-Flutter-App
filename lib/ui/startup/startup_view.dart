import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/all_breeds/all_breeds_view.dart';
import 'package:flutter_stacked_starter/ui/home/random_photo_view.dart';
import 'package:flutter_stacked_starter/ui/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StackedView<StartUpViewModel> {
const StartUpView({super.key});

@override
Widget builder(
BuildContext context,
StartUpViewModel viewModel,
Widget? child
) {
return Scaffold(
  body: getViewForIndex(viewModel.currentIndex),
  bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          items: const [
            BottomNavigationBarItem(
              label: ('Random Photo'),
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(
              label: ('All Breeds'),
              icon: Icon(Icons.list,color: Colors.black,),
              
            ),
          ],
        ),
  
);
}
@override
StartUpViewModel viewModelBuilder(BuildContext context) => StartUpViewModel();
}




 Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const RandomPhotoView();
      case 1:
        return const AllBreedsView();
      default:
        return const RandomPhotoView();
    }
  }
