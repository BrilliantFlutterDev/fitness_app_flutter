part of 'home_bloc.dart';

abstract class HomeEvent {}


class GetLocalCartDetails extends HomeEvent {
  GetLocalCartDetails();
}

class GetLocalCartCombinationDetails extends HomeEvent {
  GetLocalCartCombinationDetails();
}
class RefreshScreenEvent extends HomeEvent {
  RefreshScreenEvent();
}


