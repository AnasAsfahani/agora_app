import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../firebase_options.dart';
import '../../di/service_locator.dart';
import '../custom_bloc_observer.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = CustomBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(

      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) ;
 await setup();

    await dotenv.load(fileName: ".env");

}
