
extension IntegerExtension on int {
    String formatDuration() {
      if (this < 60) return "$this minutes";
      int hours = (this / 60).floor();
      int minutes = this % 60;
      return "${hours}h ${minutes}ms";
    }
}