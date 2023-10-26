import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/photo_service.dart';
import 'package:stacked/stacked.dart';

class RandomPhotoViewModel extends BaseViewModel {
  final _photoService = locator<PhotoService>();
  PhotoModel? _photoModel;

  String? _dropDownSelectedItem;
  String? get dropDownSelectedItem => _dropDownSelectedItem;

  PhotoModel? get photoModel => _photoModel;
  Future<void> init(breed) async {
    _photoModel = await runBusyFuture(_photoService.fetchRandomPhoto(breed));
    rebuildUi();
  }

  setDropDownValueAndFetchPhoto(String breed, String? subBreed) async {
    _dropDownSelectedItem = subBreed;
    if (breed == 'random') {
      _photoModel =
          await runBusyFuture(_photoService.fetchRandomPhoto(breed, subBreed));
    } else {
      init(breed);
    }
    rebuildUi();
  }
}
