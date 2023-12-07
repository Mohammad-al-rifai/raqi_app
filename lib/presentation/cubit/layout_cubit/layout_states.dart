part of 'layout_cubit.dart';

@immutable
abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class NewsBottomNavbarState extends LayoutStates {}

// Get Apple News API States
class GetAppleLoadingState extends LayoutStates {}

class GetAppleDoneState extends LayoutStates {}

class GetAppleErrorState extends LayoutStates {}

// Get Tesla News API States
class GetTeslaLoadingState extends LayoutStates {}

class GetTeslaDoneState extends LayoutStates {}

class GetTeslaErrorState extends LayoutStates {}

// Get Business News API States
class GetBusinessLoadingState extends LayoutStates {}

class GetBusinessDoneState extends LayoutStates {}

class GetBusinessErrorState extends LayoutStates {}

// Get Wall Street News API States
class GetWallStreetLoadingState extends LayoutStates {}

class GetWallStreetDoneState extends LayoutStates {}

class GetWallStreetErrorState extends LayoutStates {}
