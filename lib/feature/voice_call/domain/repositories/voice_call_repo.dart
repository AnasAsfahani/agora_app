import 'package:agora_app/core/network/api_result.dart';
import 'package:agora_app/feature/voice_call/data/models/join_channel_request_model.dart';

abstract class VoiceCallRepo {
  Future<ApiResult<void>> startVoiceCalling({
    required JoinChannelRequestModel joinChannelRequestModel,
  });
}
