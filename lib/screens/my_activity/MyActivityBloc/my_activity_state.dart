part of 'my_activity_bloc.dart';

@immutable
abstract class MyActivityState {}

class MyActivityInitial extends MyActivityState {}

class LoadingState extends MyActivityState {}

class RefreshScreenState extends MyActivityState {}

class DataStoredState extends MyActivityState {}

class ErrorState extends MyActivityState {
  final String error;
  ErrorState({required this.error});
}

class GetAllExerciseState extends MyActivityState {
  final RequestExerciseData exerciseData;
  GetAllExerciseState({required this.exerciseData});
}

class GetAllDaysState extends MyActivityState {
  final RequestDayData dayData;
  final double? totalCalories;
  final double? timeSpent;
  GetAllDaysState({required this.dayData, this.totalCalories, this.timeSpent});
}

class ProductClickAddedToLocalDBState extends MyActivityState {
  ProductClickAddedToLocalDBState();
}

class InternetErrorState extends MyActivityState {
  final String error;
  InternetErrorState({required this.error});
}
