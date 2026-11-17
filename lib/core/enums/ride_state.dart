enum RideState {
  searching,
  retry,
  awaitingDriverAcceptance,
  pickUp,
  inRide,
  finished,
  failed,
  terminated,
  cancelled;

  factory RideState.fromJson(String value) {
    switch (value) {
      case 'Searching':
        return RideState.searching;
      case 'Retry':
        return RideState.retry;
      case 'AwaitingDriverAcceptance':
        return RideState.awaitingDriverAcceptance;
      case 'Pickup':
        return RideState.pickUp;
      case 'InRide':
        return RideState.inRide;
      case 'Finished':
        return RideState.finished;
      case 'Failed':
        return RideState.failed;
      case 'Terminated':
        return RideState.terminated;
      case 'Cancelled':
        return RideState.cancelled;
      default:
        return RideState.searching;
    }
  }

  String toJson() {
    switch (this) {
      case RideState.searching:
        return 'Searching';
      case RideState.retry:
        return 'Retry';
      case RideState.awaitingDriverAcceptance:
        return 'AwaitingDriverAcceptance';
      case RideState.pickUp:
        return 'Pickup';
      case RideState.inRide:
        return 'InRide';
      case RideState.finished:
        return 'Finished';
      case RideState.failed:
        return 'Failed';
      case RideState.terminated:
        return 'Terminated';
      case RideState.cancelled:
        return 'Cancelled';
    }
  }
}
