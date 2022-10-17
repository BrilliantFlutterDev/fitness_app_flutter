part of 'my_activity_bloc.dart';

abstract class MyActivityEvent {}

class GetAllExerciseEvent extends MyActivityEvent {
  GetAllExerciseEvent();
}

class GetAllExerciseOfDayEvent extends MyActivityEvent {
  final String day;
  GetAllExerciseOfDayEvent({required this.day});
}

class GetAllDaysEvent extends MyActivityEvent {
  GetAllDaysEvent();
}

class GetASpecificDaysEvent extends MyActivityEvent {
  final String day;
  GetASpecificDaysEvent({required this.day});
}

class WaterGlassIncrementDecrementEvent extends MyActivityEvent {
  final RequestDayData dayData;
  final bool isIncrementing;
  WaterGlassIncrementDecrementEvent(
      {required this.dayData, required this.isIncrementing});
}

class InsertAllExercisesInLocalDBEvent extends MyActivityEvent {
  InsertAllExercisesInLocalDBEvent();
}

class RefreshScreenEvent extends MyActivityEvent {
  RefreshScreenEvent();
}
