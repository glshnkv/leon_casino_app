import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leon_casino_app/leon_casino_app.dart';
import 'package:leon_casino_app/models/wheel_model.dart';
import 'package:leon_casino_app/screens/wheel/wheel_bloc/wheel_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(WheelModelAdapter());
  await Hive.openBox('wheels');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WheelBloc>(create: (context) => WheelBloc()),
      ],
      child: LeonCasinoApp(),
    ),
  );
}
