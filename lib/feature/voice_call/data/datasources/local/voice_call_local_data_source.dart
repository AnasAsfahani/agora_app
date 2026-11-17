import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/utils/shared_pref_keys.dart';

class VoiceCallLocalDataSource {
  final SharedPreferences prefs;

  VoiceCallLocalDataSource(this.prefs);


  Future<void> setRemoteUid(int remoteUid) async{
   await prefs.setInt(SharedPrefKeys.remoteUid, remoteUid);

  }


  Future<int> getRemoteUid() async{
    return  prefs.getInt(SharedPrefKeys.remoteUid ) ?? 0  ;

  }

  Future<void> clearToken() async {
    await prefs.remove(
      SharedPrefKeys.remoteUid,
    );
  }
}