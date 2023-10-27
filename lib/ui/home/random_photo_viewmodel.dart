import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/photo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RandomPhotoViewModel extends BaseViewModel {
  final _photoService = locator<PhotoService>();
  final _navigationService = locator<NavigationService>();
  PhotoModel? _photoModel;
  String? _dropDownSelectedItem;
  String? get dropDownSelectedItem => _dropDownSelectedItem;
  List _imageList = [];
  List get imageList => _imageList;

  PhotoModel? get photoModel => _photoModel;
  Future<void> init(breed) async {
    _photoModel = await runBusyFuture(_photoService.fetchRandomPhoto(breed));
    rebuildUi();
  }

  setDropDownValueAndFetchPhoto(String breed, String? subBreed) async {
    _dropDownSelectedItem = subBreed;

    _photoModel =
        await runBusyFuture(_photoService.fetchRandomPhoto(breed, subBreed));

    rebuildUi();
  }

 void fetchImageList(String breed, String? subBreed) async {
    _imageList = await runBusyFuture(_photoService.fetchImageList(breed, subBreed),busyObject: 'imageListBusy');
    rebuildUi();
  }

  void back() => _navigationService.back();
}
