import 'package:agora_app/agora_app.dart';
import 'package:agora_app/core/helper/functions/init_app.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main()async{
  await initApp() ;
  return runApp(const AgoraApp()) ;

}

