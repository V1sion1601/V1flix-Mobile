import 'package:app/src/models/source.dart';

handleSource(List<Source> sources) {
  if (sources.isEmpty) return;
  int index = sources.indexWhere(
      (src) => (src.kind == 'onedrive' && src.value.contains("https://")));
  return index == 1 ? sources[index] : sources[0];
}
