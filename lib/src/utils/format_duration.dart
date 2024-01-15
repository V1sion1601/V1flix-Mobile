
extension IntegerExtension on int {
    String formatDuration() {

      if (this < 60) return "$this minutes";
      double hours = (this / 60).floor() as double;
      double minutes = this % 60;
      return "$hours hrs $minutes ms";
    }
}