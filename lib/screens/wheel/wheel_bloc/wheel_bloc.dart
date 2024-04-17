import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leon_casino_app/models/wheel_model.dart';
import 'package:meta/meta.dart';

part 'wheel_event.dart';
part 'wheel_state.dart';

class WheelBloc extends Bloc<WheelEvent, WheelState> {
  WheelBloc() : super(WheelInitial()) {
    on<GetAllWheelsEvent>(_getAllWheelsHandler);
    on<AddWheelEvent>(_addWheelHandler);
    on<DeleteWheelEvent>(_deleteWheelHandler);
    on<EditWheelEvent>(_editWheelHandler);
  }

  void _getAllWheelsHandler(
      GetAllWheelsEvent event, Emitter<WheelState> emit) async {
    List<WheelModel> wheels = [];

    final wheelBox = Hive.box('wheels');

    if (wheelBox.isNotEmpty) {
      for (int i = 0; i < wheelBox.length; i++) {
        wheels.add(wheelBox.getAt(i));
      }

      emit(LoadedAllWheelsState(wheels: wheels.reversed.toList()));
    }
  }

  void _addWheelHandler(
      AddWheelEvent event, Emitter<WheelState> emit) async {
    final wheelBox = Hive.box('wheels');
    wheelBox.add(event.wheel);
  }

  void _deleteWheelHandler(
      DeleteWheelEvent event, Emitter<WheelState> emit) async {

    List<WheelModel> wheels = [];

    final wheelBox = Hive.box('wheels');

    if (wheelBox.isNotEmpty) {
      for (int i = 0; i < wheelBox.length; i++) {
        wheels.add(wheelBox.getAt(i));
      }

      final int _foundIndex = wheels.indexOf(event.wheel);
      wheelBox.deleteAt(_foundIndex);
    }
  }

  void _editWheelHandler(
      EditWheelEvent event, Emitter<WheelState> emit) async {

    List<WheelModel> wheels = [];

    final wheelBox = Hive.box('wheels');

    if (wheelBox.isNotEmpty) {
      for (int i = 0; i < wheelBox.length; i++) {
        wheels.add(wheelBox.getAt(i));
      }

      final int _foundIndex = wheels.indexOf(event.wheel);
      wheelBox.putAt(_foundIndex, event.editedWheel);
    }
  }
}
