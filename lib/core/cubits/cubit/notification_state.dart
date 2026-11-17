import 'package:equatable/equatable.dart';
import '../../models/app_norification_model.dart';

abstract class AppNotificationState extends Equatable {
  const AppNotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends AppNotificationState {}

class NotificationReceived extends AppNotificationState {
  final AppNotificationModel notification;
  const NotificationReceived(this.notification);

  @override
  List<Object?> get props => [notification];
}
