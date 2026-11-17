import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/app_norification_model.dart';
import 'notification_state.dart';

class AppNotificationCubit extends Cubit<AppNotificationState> {
  AppNotificationCubit() : super(NotificationInitial());

  void emitNotification(AppNotificationModel notification) {
    emit(NotificationReceived(notification));
  }
}
