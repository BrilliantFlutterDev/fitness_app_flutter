part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetAllExerciseEvent extends HomeEvent {
  GetAllExerciseEvent();
}

class GetAllExerciseOfDayEvent extends HomeEvent {
  final String day;
  GetAllExerciseOfDayEvent({required this.day});
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
