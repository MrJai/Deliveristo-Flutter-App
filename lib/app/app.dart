import 'package:flutter_stacked_starter/services/api_service.dart';
import 'package:flutter_stacked_starter/services/dio_service.dart';
import 'package:flutter_stacked_starter/services/photo_service.dart';
import 'package:flutter_stacked_starter/ui/home/random_photo_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: RandomPhotoView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DioService, asType: ApiService),
    LazySingleton(classType: PhotoService),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves No Purpose */
}
