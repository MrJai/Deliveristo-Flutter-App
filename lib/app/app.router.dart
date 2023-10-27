// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:flutter_stacked_starter/ui/all_breeds/all_breeds_view.dart'
    as _i3;
import 'package:flutter_stacked_starter/ui/random_photo/random_photo_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const randomPhotoView = '/random-photo-view';

  static const allBreedsView = '/';

  static const all = <String>{
    randomPhotoView,
    allBreedsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.randomPhotoView,
      page: _i2.RandomPhotoView,
    ),
    _i1.RouteDef(
      Routes.allBreedsView,
      page: _i3.AllBreedsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.RandomPhotoView: (data) {
      final args = data.getArgs<RandomPhotoViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.RandomPhotoView(
            key: args.key, breed: args.breed, subBreedList: args.subBreedList),
        settings: data,
      );
    },
    _i3.AllBreedsView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.AllBreedsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class RandomPhotoViewArguments {
  const RandomPhotoViewArguments({
    this.key,
    required this.breed,
    this.subBreedList,
  });

  final _i4.Key? key;

  final String breed;

  final List<String>? subBreedList;

  @override
  String toString() {
    return '{"key": "$key", "breed": "$breed", "subBreedList": "$subBreedList"}';
  }

  @override
  bool operator ==(covariant RandomPhotoViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.breed == breed &&
        other.subBreedList == subBreedList;
  }

  @override
  int get hashCode {
    return key.hashCode ^ breed.hashCode ^ subBreedList.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToRandomPhotoView({
    _i4.Key? key,
    required String breed,
    List<String>? subBreedList,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.randomPhotoView,
        arguments: RandomPhotoViewArguments(
            key: key, breed: breed, subBreedList: subBreedList),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllBreedsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allBreedsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRandomPhotoView({
    _i4.Key? key,
    required String breed,
    List<String>? subBreedList,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.randomPhotoView,
        arguments: RandomPhotoViewArguments(
            key: key, breed: breed, subBreedList: subBreedList),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllBreedsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allBreedsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
