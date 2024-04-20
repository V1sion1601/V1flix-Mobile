import 'package:app/src/common_widgets/number_input.dart';
import 'package:app/src/extensions/format_string.dart';
import 'package:flutter/material.dart';

const List<String> scoreList = <String>[
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10'
    ],
    statusList = <String>[
      " ",
      "watching",
      "completed",
      "dropped",
      "on-hold",
      "plans to watch"
    ];

class ListSeriesInputs extends StatelessWidget {
  const ListSeriesInputs(
      {super.key,
      required this.currentScore,
      required this.currentStatus,
      required this.currentEpisode,
      required this.setEpisode,
      required this.setStatus,
      required this.setScore});

  final int currentEpisode;
  final String currentScore, currentStatus;
  final void Function(int) setEpisode;
  final void Function(String) setStatus, setScore;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Score",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            DropdownMenu<String>(
              width: width,
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
              initialSelection: currentScore,
              onSelected: (String? value) {
                setScore(value!);
              },
              dropdownMenuEntries:
                  scoreList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Status",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            DropdownMenu<String>(
              width: width,
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
              initialSelection: currentStatus.toString(),
              onSelected: (String? value) {
                setStatus(value!);
              },
              dropdownMenuEntries:
                  statusList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                    value: value, label: value.capitalize());
              }).toList(),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Episode",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            NumberInputWithIncrementDecrement(
              width: width,
              setNumber: setEpisode,
              initialText: currentEpisode.toString(),
            )
          ],
        ),
      ],
    );
  }
}
