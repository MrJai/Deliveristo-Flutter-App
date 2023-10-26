import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/app/app.router.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/photo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AllBreedsViewModel extends BaseViewModel {
  final _photoService = locator<PhotoService>();
  final _navigationService = locator<NavigationService>();
  
  AllBreedsModel? _allBreedsModel;
  AllBreedsModel? get allBreedsModel => _allBreedsModel ;
  Future<void> init() async {
    _allBreedsModel = await runBusyFuture(_photoService.fetchAllBreedsList());
    rebuildUi();
  }

  navigateToRandomPhotoByBreed(String breed,List<String> subBreedList) {
    _navigationService.navigateToRandomPhotoView(breed:breed,subBreedList: subBreedList);
  }
}