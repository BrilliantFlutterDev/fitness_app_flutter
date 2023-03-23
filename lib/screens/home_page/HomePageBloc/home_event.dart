part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetAllExerciseEvent extends HomeEvent {
  GetAllExerciseEvent();
}

class GetAllExerciseOfDayEvent extends HomeEvent {
  final String day;
  GetAllExerciseOfDayEvent({required this.day});
}

class RapsIncrementDecrementEvent extends HomeEvent {
  late final ExerciseModelLocalDB exerciseModelLocalDB;
  final bool isIncrementing;
  final bool isDecrementing;
  RapsIncrementDecrementEvent(
      {required this.exerciseModelLocalDB, required this.isIncrementing, required this.isDecrementing});
}

class TimeIncrementDecrementEvent extends HomeEvent {
  late final ExerciseModelLocalDB exerciseModelLocalDB;
  final bool isIncrementing;
  final bool isDecrementing;
  TimeIncrementDecrementEvent(
      {required this.exerciseModelLocalDB, required this.isIncrementing, required this.isDecrementing});
}

class ChangeExerciseStatusToDoneEvent extends HomeEvent {
  late final ExerciseModelLocalDB exerciseModelLocalDB;

  ChangeExerciseStatusToDoneEvent(
      {required this.exerciseModelLocalDB,});
}

class ChangeExerciseStatusToUnDoneEvent extends HomeEvent {
  late final ExerciseModelLocalDB exerciseModelLocalDB;

  ChangeExerciseStatusToUnDoneEvent(
      {required this.exerciseModelLocalDB,});
}

class ChangeExerciseStatusToResetEvent extends HomeEvent {
  // late final ExerciseModelLocalDB exerciseModelLocalDB;

  ChangeExerciseStatusToResetEvent();
}

class ClearExerciseEvent extends HomeEvent {

  ClearExerciseEvent();
}

class RemoveDaysEvent extends HomeEvent {

  RemoveDaysEvent();
}

class DeleteExerciseInADayEvent extends HomeEvent {
  late final RequestExerciseData exerciseData;
  late final int index;

  DeleteExerciseInADayEvent(
      {required this.exerciseData,required this.index});
}


class UpdateDayProgressEvent extends HomeEvent {
  final DayModelLocalDB dayModelLocalDB;
  final  double progress;
  UpdateDayProgressEvent(
      {required this.dayModelLocalDB,required this.progress,});
}


class GetAllDaysEvent extends HomeEvent {
  GetAllDaysEvent();
}

class InsertAllExercisesInLocalDBEvent extends HomeEvent {
  InsertAllExercisesInLocalDBEvent();
}

class WaterGlassIncrementDecrementEvent extends HomeEvent {
  final RequestDayData dayData;
  final bool isIncrementing;
  WaterGlassIncrementDecrementEvent(
      {required this.dayData, required this.isIncrementing});
}

class RefreshScreenEvent extends HomeEvent {
  RefreshScreenEvent();
}
