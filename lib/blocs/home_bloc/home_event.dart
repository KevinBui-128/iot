part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => null;
}

// Yard - Gara
class PressBtnLampYardEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class PressBtnDoorYardEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class PressBtnClothesYardEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

// Living room
class PressBtnLampLivingEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class PressBtnFanLivingEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

// Bedroom
class PressBtnLampBedEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class PressBtnFanBedEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

// Kitchen
class PressBtnLampKitchenEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class PressBtnFanKitchenEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

// Bathroom
class PressBtnLampBathEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class PressBtnFanBathEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

// Voice
class PressBtnCheckVoiceEvent extends HomeEvent {
  BuildContext context;
  PressBtnCheckVoiceEvent({this.context});
  @override
  List<Object> get props => [context];
}

class PressBtnUncheckVoiceEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}
