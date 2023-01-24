part of 'account_screen_bloc.dart';

abstract class AccountScreenEvent {}

class ChangeExerciseStatusToResetEvent extends AccountScreenEvent {
  ChangeExerciseStatusToResetEvent();
}

class InsertAllUserDataInLocalDBEvent extends AccountScreenEvent {
  late final String? gender;
  late final String? dateOfBirth;
  late final String? weight;
  late final String? height;
  late final String? countDownTime;
  late final int? trainingRest;
  late final bool? turnOnWaterTracker;
  late final bool? drinkNotification;
  InsertAllUserDataInLocalDBEvent({this.gender, this.dateOfBirth, this.weight, this.height, this.countDownTime, this.trainingRest, this.turnOnWaterTracker, this.drinkNotification});
}

class GetUserTrainingDataEvent extends AccountScreenEvent {
  final int trainRest;
  GetUserTrainingDataEvent({required this.trainRest});
}

class RefreshScreenEvent extends AccountScreenEvent {
  RefreshScreenEvent();
}