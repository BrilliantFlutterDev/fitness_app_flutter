part of 'account_screen_bloc.dart';

@immutable
abstract class AccountScreenState {}

class UserDataInitial extends AccountScreenState {}

class LoadingState extends AccountScreenState {}

class RefreshScreenState extends AccountScreenState {}

class DataStoredState extends AccountScreenState {}

class ErrorState extends AccountScreenState {
  final String error;
  ErrorState({required this.error});
}

class GetUserTrainingDataState extends AccountScreenState {
  final RequestUserData userDataList;
  GetUserTrainingDataState({required this.userDataList});
}

// class GetCountDownState extends AccountScreenState {
//   // final RequestUserData userData;
//   final UserDataModelLocalDB userDataModelLocalDB;
//   final int value;
//   GetCountDownState({required this.userDataModelLocalDB, required this.value});
// }

class UpdateDayProgressState extends AccountScreenState {
  final DayModelLocalDB dayModelLocalDB;
  UpdateDayProgressState({required this.dayModelLocalDB});
}

class ProductClickAddedToLocalDBState extends AccountScreenState {
  ProductClickAddedToLocalDBState();
}

class InternetErrorState extends AccountScreenState {
  final String error;
  InternetErrorState({required this.error});
}