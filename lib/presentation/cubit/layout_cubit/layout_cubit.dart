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
}
