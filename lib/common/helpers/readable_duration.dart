String formatDurationInHhMmSs(Duration duration) {
  final hh = (duration.inHours).toString().padLeft(2, '0');
  final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');
  final ss = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return '$hh:$mm:$ss';
}
