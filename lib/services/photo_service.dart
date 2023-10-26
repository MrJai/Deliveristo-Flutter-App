import 'package:flutter_stacked_starter/app/app.locator.dart';
import 'package:flutter_stacked_starter/models/application_models.dart';
import 'package:flutter_stacked_starter/services/api_service.dart';

class PhotoService {
  final _apiService = locator<ApiService>();
  Future<PhotoModel> fetchRandomPhoto(breed, [subBreed]) async {
    ApiResponse apiResponse = await _apiService.get(
        url: subBreed == null
            ? 'https://dog.ceo/api/breed/$breed/images/random'
            : 'https://dog.ceo/api/breed/$breed/$subBreed/images/random');
    return PhotoModel.fromJson(apiResponse.data);
  }

  Future<AllBreedsModel> fetchAllBreedsList() async {
    ApiResponse apiResponse =
        await _apiService.get(url: 'https://dog.ceo/api/breeds/list/all');
    return AllBreedsModel.fromJson(apiResponse.data);
  }

  Future<List> fetchImageList(String breed, String? subBreed) async {
    ApiResponse apiResponse = await _apiService.get(
        url: subBreed == null
            ? 'https://dog.ceo/api/breed/$breed/images'
            : 'https://dog.ceo/api/breed/$breed/$subBreed/images');
    List images = apiResponse.data['message'] as List;
    return images;
  }
}
