import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/photo_service.dart';
import 'package:stacked/stacked.dart';

class AllBreedsViewModel extends BaseViewModel {
  final _photoService = locator<PhotoService>();
  AllBreedsModel? _allBreedsModel;
  AllBreedsModel? get allBreedsModel => _allBreedsModel ;
  void init() {
    runBusyFuture(_photoService.fetchAllBreedsList());
  }
}