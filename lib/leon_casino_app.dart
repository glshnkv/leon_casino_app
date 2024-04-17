import 'package:flutter/material.dart';
import 'package:leon_casino_app/router/router.dart';

class LeonCasinoApp extends StatelessWidget {
  LeonCasinoApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Codec Pro'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
