import 'package:app/src/models/episodes.dart';
import 'package:flutter/material.dart';

class SubtitlesDialog extends StatelessWidget {
  const SubtitlesDialog(
      {Key? key,
      required List<SubtitleSeries> subtitles,
      required SubtitleSeries selected,
      required this.setSubtitle})
      : _subtitle = subtitles,
        _selected = selected,
        super(key: key);

  final List<SubtitleSeries> _subtitle;
  final SubtitleSeries _selected;
  final void Function(SubtitleSeries) setSubtitle;

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;

    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        final subtitle = _subtitle[index];
        return ListTile(
          dense: true,
          title: Row(
            children: [
              if (subtitle == _selected)
                Icon(
                  Icons.check,
                  size: 20.0,
                  color: selectedColor,
                )
              else
                Container(width: 20.0),
              const SizedBox(width: 16.0),
              Text(subtitle.label),
            ],
          ),
          selected: subtitle.label == _selected.label,
          onTap: () {
            setSubtitle(subtitle);
            Navigator.of(context).pop(subtitle);
          },
        );
      },
      itemCount: _subtitle.length,
    );
  }
}
