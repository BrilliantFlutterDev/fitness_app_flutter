part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetAllExerciseEvent extends HomeEvent {
  GetAllExerciseEvent();
}

class GetAllExerciseOfDayEvent extends HomeEvent {
  final String day;
  GetAllExerciseOfDayEvent({required this.day});
}

class RapsTimeIncrementDecrementEvent extends HomeEvent {
  late final ExerciseModelLocalDB exerciseModelLocalDB;
  final bool isIncrementing;
  RapsTimeIncrementDecrementEvent(
      {required this.exerciseModelLocalDB, required this.isIncrementing});
}
class ChangeExerciseStatusToDoneEvent extends HomeEvent {
  late final ExerciseModelLocalDB exerciseModelLocalDB;

  ChangeExerciseStatusToDoneEvent(
      {required this.exerciseModelLocalDB,});
}
class ChangeExerciseStatusToResetEvent extends HomeEvent {
  // late final ExerciseModelLocalDB exerciseModelLocalDB;

  ChangeExerciseStatusToResetEvent();
}
class DeleteExerciseInADayEvent extends HomeEvent {
  late final RequestExerciseData exerciseData;
  late final int index;

  DeleteExerciseInADayEvent(
      {required this.exerciseData,required this.index});
}


class UpdateDayProgressEvent extends HomeEvent {
  final DayModelLocalDB dayModelLocalDB;
  final  int progress;
  UpdateDayProgressEvent(
      {required this.dayModelLocalDB,required this.progress,});
}


class GetAllDaysEvent extends HomeEvent {
  GetAllDaysEvent();
}

class InsertAllExercisesInLocalDBEvent extends HomeEvent {
  InsertAllExercisesInLocalDBEvent();
}

class RefreshScreenEvent extends HomeEvent {
  RefreshScreenEvent();
}
