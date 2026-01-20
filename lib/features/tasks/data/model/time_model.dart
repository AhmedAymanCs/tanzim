class TimeModel {
  final String hour;
  final String minute;
  final String period; // morning / evening

  const TimeModel({
    required this.hour,
    required this.minute,
    required this.period,
  });
}
