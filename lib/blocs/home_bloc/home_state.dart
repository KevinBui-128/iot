part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => null;
}

// Yard - Gara
class LampYardState extends HomeState {
  @override
  List<Object> get props => null;
}

class DoorYardState extends HomeState {
  @override
  List<Object> get props => null;
}

class ClothesYardState extends HomeState {
  @override
  List<Object> get props => null;
}

// Living room
class LampLivingState extends HomeState {
  @override
  List<Object> get props => null;
}

class FanLivingState extends HomeState {
  @override
  List<Object> get props => null;
}

// Bedroom
class LampBedState extends HomeState {
  @override
  List<Object> get props => null;
}

class FanBedState extends HomeState {
  @override
  List<Object> get props => null;
}

// Kitchen
class LampKitchenState extends HomeState {
  @override
  List<Object> get props => null;
}

class FanKitchenState extends HomeState {
  @override
  List<Object> get props => null;
}

// Bathroom
class LampBathState extends HomeState {
  @override
  List<Object> get props => null;
}

class FanBathState extends HomeState {
  @override
  List<Object> get props => null;
}

// Voice
class CheckVoiceState extends HomeState {
  @override
  List<Object> get props => null;
}

class UncheckVoiceState extends HomeState {
  @override
  List<Object> get props => null;
}

// Error
class ErrorState extends HomeState {
  final String errorTitle;
  final String errorMessage;
  ErrorState({
    @required this.errorTitle,
    @required this.errorMessage,
  });
  @override
  List<Object> get props => [errorTitle,errorMessage];
}
