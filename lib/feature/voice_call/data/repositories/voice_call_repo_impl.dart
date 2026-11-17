import 'package:agora_app/core/network/api_error_handler.dart';
import 'package:agora_app/core/network/api_result.dart';
import 'package:agora_app/feature/voice_call/data/datasources/remote/voice_call_service.dart';
import 'package:agora_app/feature/voice_call/data/models/join_channel_request_model.dart';
import 'package:agora_app/feature/voice_call/domain/repositories/voice_call_repo.dart';

class VoiceCallRepoImpl implements VoiceCallRepo {
  final VoiceCallService voiceCallService;
  VoiceCallRepoImpl(this.voiceCallService);
  @override
  Future<ApiResult<void>> startVoiceCalling({
    required JoinChannelRequestModel joinChannelRequestModel,
  }) async {
    try {
      final response = await voiceCallService.startVoiceCalling(
        joinChannelRequestModel,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
