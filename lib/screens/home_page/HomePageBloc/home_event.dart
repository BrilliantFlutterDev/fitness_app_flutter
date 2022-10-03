part of 'home_bloc.dart';

abstract class HomeEvent {}


class GetAllExerciseEvent extends HomeEvent {
  GetAllExerciseEvent();
}

class InsertAllExercisesInLocalDBEvent extends HomeEvent {
  InsertAllExercisesInLocalDBEvent();
}
class RefreshScreenEvent extends HomeEvent {
  RefreshScreenEvent();
}


