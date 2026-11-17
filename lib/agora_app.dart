import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
GlobalKey<ScaffoldMessengerState>() ;
class AgoraApp extends StatelessWidget {
  const AgoraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerState,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,

    );
  }
}
