
import 'package:freezed_annotation/freezed_annotation.dart';
part 'voice_call_state.freezed.dart';


@freezed
class VoiceCallState <T> with _$VoiceCallState<T>{
  const factory VoiceCallState.initial() = _Initial ;
  const factory VoiceCallState.loading() = Loading ;
  const factory VoiceCallState.success(T data) = Success<T> ;
  const factory VoiceCallState.error({required String error}) = Error ;

}


