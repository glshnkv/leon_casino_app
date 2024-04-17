part of 'wheel_bloc.dart';

@immutable
abstract class WheelState {}

class WheelInitial extends WheelState {}

class LoadedAllWheelsState extends WheelState {
  final List<WheelModel> wheels;

  LoadedAllWheelsState({required this.wheels});
}