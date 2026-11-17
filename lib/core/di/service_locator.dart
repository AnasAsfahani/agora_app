
import 'package:agora_app/feature/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:agora_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:agora_app/feature/auth/domain/repositories/auth_repo.dart';
import 'package:agora_app/feature/voice_call/data/datasources/local/voice_call_local_data_source.dart';
import 'package:agora_app/feature/voice_call/data/datasources/remote/voice_call_service.dart';
import 'package:agora_app/feature/voice_call/data/repositories/voice_call_repo_impl.dart';
import 'package:agora_app/feature/voice_call/domain/repositories/voice_call_repo.dart';
import 'package:agora_app/feature/voice_call/presentation/cubit/voice_call_cubit.dart';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/presentation/cubit/auth_cubit.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // ======================= CORE =======================

  final Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(() => dio);

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // ======================= VOICE CALL =======================

  // Local Data Source
  getIt.registerLazySingleton<VoiceCallLocalDataSource>(
        () => VoiceCallLocalDataSource(
      getIt<SharedPreferences>(),
    ),
  );

  // Service
  getIt.registerLazySingleton<VoiceCallService>(
        () => VoiceCallService(
      getIt<VoiceCallLocalDataSource>(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<VoiceCallRepo>(
        () => VoiceCallRepoImpl(
      getIt<VoiceCallService>(),
    ),
  );

  // Cubit
  getIt.registerFactory<VoiceCallCubit>(
        () => VoiceCallCubit(
      getIt<VoiceCallRepo>(),
    ),
  );

  // ======================= AUTH =======================
  getIt.registerLazySingleton<FirebaseAuth>(
        () => FirebaseAuth.instance,
  );


  getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(getIt<FirebaseAuth>()),
  );


  getIt.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(
      getIt<AuthRemoteDataSource>(),
    ),
  );


  getIt.registerFactory<AuthCubit>(
        () => AuthCubit(
      getIt<AuthRepo>(),
    ),
  );

}


