class TimeModel {
  final int hour;
  final int minute;
  final String period; // morning / evening

  const TimeModel({
    required this.hour,
    required this.minute,
    required this.period,
  });
}
