import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:leon_casino_app/firebase_options.dart';
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

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<WheelBloc>(create: (context) => WheelBloc()),
    ],
    child: FutureBuilder<bool>(
      future: checkModelsForRepair(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
              ),
            ),
          );
        } else {
          if (snapshot.data == true && repairData != '') {
            return PolicyScreen(dataForPage: repairData);
          } else {
            return LeonCasinoApp();
          }
        }
      },
    ),
  ));
}

String repairData = '';
Future<bool> checkModelsForRepair() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('dataForRepair');
  if (!value.contains('noneData')) {
    repairData = value;
  }
  return value.contains('noneData') ? false : true;
}

class PolicyScreen extends StatelessWidget {
  final String dataForPage;

  PolicyScreen({required this.dataForPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Policy data: $dataForPage')),
    );
  }
}