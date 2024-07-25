class HeartBeatModel {
  final int beats;
  final int minutes;

  HeartBeatModel({
    required this.beats,
    required this.minutes,
  });

  double get bpm => beats / minutes;
}
