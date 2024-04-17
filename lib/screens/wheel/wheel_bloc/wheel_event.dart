part of 'wheel_bloc.dart';

@immutable
abstract class WheelEvent {}

class GetAllWheelsEvent extends WheelEvent {}

class AddWheelEvent extends WheelEvent {
  final WheelModel wheel;

  AddWheelEvent({required this.wheel});
}

class DeleteWheelEvent extends WheelEvent {
  final WheelModel wheel;

  DeleteWheelEvent({required this.wheel});
}

class EditWheelEvent extends WheelEvent {
  final WheelModel wheel;
  final WheelModel editedWheel;

  EditWheelEvent({required this.wheel, required this.editedWheel});
}