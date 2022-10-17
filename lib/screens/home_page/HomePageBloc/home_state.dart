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
  GetAllExerciseState({required this.exerciseData});
}
class UpdateAllExerciseState extends HomeState {
  final ExerciseModelLocalDB exerciseModelLocalDB;
  UpdateAllExerciseState({required this.exerciseModelLocalDB});
}

class GetAllDaysState extends HomeState {
  final RequestDayData dayData;
  GetAllDaysState({required this.dayData});
}
class UpdateDayProgressState extends HomeState {
  final DayModelLocalDB dayModelLocalDB;
  UpdateDayProgressState({required this.dayModelLocalDB});
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
