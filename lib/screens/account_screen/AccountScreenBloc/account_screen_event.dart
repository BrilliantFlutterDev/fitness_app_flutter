part of 'account_screen_bloc.dart';

abstract class AccountScreenEvent {}

class ChangeExerciseStatusToResetEvent extends AccountScreenEvent {
  ChangeExerciseStatusToResetEvent();
}

class InsertAllUserDataInLocalDBEvent extends AccountScreenEvent {

  late final String? weight;
  late final String? height;
  late final bool? turnOnWaterTracker;
  late final bool? drinkNotification;
  InsertAllUserDataInLocalDBEvent({this.weight, this.height, this.turnOnWaterTracker, this.drinkNotification});
}

// class CountDownEvent extends AccountScreenEvent {
//   UserDataModelLocalDB? userModelLocalDB;
//   // final RequestUserData userData;
//   int value;
//   CountDownEvent(
//       {this.userModelLocalDB, required this.value});
// }

class RefreshScreenEvent extends AccountScreenEvent {
  RefreshScreenEvent();
}