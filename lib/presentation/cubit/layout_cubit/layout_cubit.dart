import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raqi_test_app/app/resources/constants.dart';
import 'package:raqi_test_app/app/resources/urls.dart';
import 'package:raqi_test_app/data/remote/dio_helper.dart';
import 'package:raqi_test_app/domain/models/responses/news_response_model.dart';
import 'package:raqi_test_app/presentation/screens/apple/apple_screen.dart';
import 'package:raqi_test_app/presentation/screens/businees/businees_screen.dart';
import 'package:raqi_test_app/presentation/screens/tesla/tesla_screen.dart';
import 'package:raqi_test_app/presentation/screens/wall%20street/wall_street_screen.dart';

part 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> titles = [
    "Apple News",
    "Business News",
    "Tesla News",
    "Wall Street News",
  ];

  List<Widget> screens = [
    const AppleScreen(),
    const BusinessScreen(),
    const TeslaScreen(),
    const WallStreetScreen(),
  ];

  final List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Apple',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.car_crash),
      label: 'Tesla',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.streetview),
      label: 'Wall Street',
    ),
  ];

  void changeBottomNavBarIndex({
    required int index,
  }) {
    if (index == 1) {
      getBusinessNews();
    }
    if (index == 2) {
      getTeslaNews();
    }
    if (index == 3) {
      getWallStreetNews();
    }

    currentIndex = index;
    emit(NewsBottomNavbarState());
  }

  // Get Apple News API

  NewsResponseModel appleNews = NewsResponseModel();
  getAppleNews() async {
    emit(GetAppleLoadingState());

    DioHelper.instance.getData(
      url: Urls.appleUrl,
      query: {
        "apiKey": Constants.apiKey,
        "q": "apple",
        "from": "2023-12-05",
        "to": "2023-12-05",
        "sortBy": "popularity",
      },
    ).then((value) {
      appleNews = NewsResponseModel.fromJson(value.data);
      emit(GetAppleDoneState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetAppleErrorState());
      },
    );
  }

  // Get Business News API
  NewsResponseModel businessNews = NewsResponseModel();
  getBusinessNews() async {
    emit(GetBusinessLoadingState());

    DioHelper.instance.getData(
      url: Urls.businessUrl,
      query: {
        "apiKey": Constants.apiKey,
        "country": "us",
        "category": "business",
      },
    ).then((value) {
      businessNews = NewsResponseModel.fromJson(value.data);
      emit(GetBusinessDoneState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetBusinessErrorState());
      },
    );
  }

  // Get Tesla News API
  NewsResponseModel teslaNews = NewsResponseModel();
  getTeslaNews() async {
    emit(GetTeslaLoadingState());

    DioHelper.instance.getData(
      url: Urls.teslaUrl,
      query: {
        "apiKey": Constants.apiKey,
        "q": "tesla",
        "from": "2023-11-06",
        "sortBy": "publishedAt",
      },
    ).then((value) {
      teslaNews = NewsResponseModel.fromJson(value.data);
      emit(GetTeslaDoneState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetTeslaErrorState());
      },
    );
  }

  // Get Wall Street News API
  NewsResponseModel wallStreetNews = NewsResponseModel();
  getWallStreetNews() async {
    emit(GetWallStreetLoadingState());

    DioHelper.instance.getData(
      url: Urls.wallStreetUrl,
      query: {
        "apiKey": Constants.apiKey,
        "domains": "wsj.com",
      },
    ).then((value) {
      wallStreetNews = NewsResponseModel.fromJson(value.data);
      emit(GetWallStreetDoneState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetWallStreetErrorState());
      },
    );
  }
}
