part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class ProductInitial extends HomeState {}

class LoadingState extends HomeState {}

class RefreshScreenState extends HomeState {}

class DataStoredState extends HomeState {}

class ErrorState extends HomeState {
  final String error;
  ErrorState({required this.error});
}

class GetAllExerciseState extends HomeState {
  final RequestExerciseData exerciseData;
  final double? calories;
  final double? totalTime;
  GetAllExerciseState({required this.exerciseData, this.calories, this.totalTime});       // this.calories
}

class SwapAExerciseOfDayState extends HomeState{
  final bool isSuccess;
  final String? error;

  SwapAExerciseOfDayState({required this.isSuccess, this.error});

  factory SwapAExerciseOfDayState.success() {
    return SwapAExerciseOfDayState(isSuccess: true);
  }

  factory SwapAExerciseOfDayState.error(String error) {
    return SwapAExerciseOfDayState(isSuccess: false, error: error);
  }
}

class UpdateAllExerciseState extends HomeState {
  final ExerciseModelLocalDB exerciseModelLocalDB;
  UpdateAllExerciseState({required this.exerciseModelLocalDB});
}

class ReverseExerciseState extends HomeState {
  final ExerciseModelLocalDB exerciseModelLocalDB;
  ReverseExerciseState({required this.exerciseModelLocalDB});
}

class GetAllDaysState extends HomeState {
  final RequestDayData dayData;
  GetAllDaysState({required this.dayData});
}

class UpdateDayProgressState extends HomeState {
  final DayModelLocalDB dayModelLocalDB;
  UpdateDayProgressState({required this.dayModelLocalDB});
}

class ReverseDayProgressState extends HomeState {
  final DayModelLocalDB dayModelLocalDB;
  ReverseDayProgressState({required this.dayModelLocalDB});
}

// class CartCombinationDetailsLocalDBState extends HomeState {
//   final RequestUserCartProductsCombinations requestUserCartProductsCombinations;
//   CartCombinationDetailsLocalDBState(
//       {required this.requestUserCartProductsCombinations});
// }
//
// class GetLocalUserProductsClickDataState extends HomeState {
//   final RequestUserProductClicksData localUserClicksResponse;
//   GetLocalUserProductsClickDataState({required this.localUserClicksResponse});
// }

class ProductClickAddedToLocalDBState extends HomeState {
  ProductClickAddedToLocalDBState();
}

class InternetErrorState extends HomeState {
  final String error;
  InternetErrorState({required this.error});
}
