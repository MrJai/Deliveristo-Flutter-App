import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/photo_service.dart';
import 'package:stacked/stacked.dart';

class RandomPhotoViewModel extends BaseViewModel {
  final _photoService = locator<PhotoService>();
  PhotoModel? _photoModel;
  PhotoModel? get photoModel => _photoModel;
  Future<void> init() async {
     _photoModel = await runBusyFuture(_photoService.fetchRandomPhoto());
     rebuildUi();

  }
}