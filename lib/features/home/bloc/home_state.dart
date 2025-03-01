part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class ActionHomeState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeNavigatetoWishlistPageActionState extends ActionHomeState {}

class HomeNavigatetoCartPageActionState extends ActionHomeState {}
