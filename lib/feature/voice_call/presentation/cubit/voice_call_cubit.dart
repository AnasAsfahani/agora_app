import 'package:agora_app/core/cubits/base_cubit/base_cubit.dart';
import 'package:agora_app/core/network/api_result.dart';
import 'package:agora_app/feature/voice_call/data/models/join_channel_request_model.dart';
import 'package:agora_app/feature/voice_call/domain/repositories/voice_call_repo.dart';
import 'package:agora_app/feature/voice_call/presentation/cubit/voice_call_state.dart';

class VoiceCallCubit extends BaseCubit<VoiceCallState> {
  final VoiceCallRepo repo ;
  VoiceCallCubit(this.repo) : super(VoiceCallState.initial());


  emitStartVoiceCalling(JoinChannelRequestModel joinChannelRequestModel)async {
    safeEmit(VoiceCallState.loading()) ;
    final response = await repo.startVoiceCalling(joinChannelRequestModel: joinChannelRequestModel)  ;
    response.when(
      success: (x){
        safeEmit(VoiceCallState.success(response)) ;
      },
      failure: (e){
        safeEmit(VoiceCallState.error(error: e.message)) ;

      }


    );






  }









}
