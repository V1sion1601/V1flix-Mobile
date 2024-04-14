// import 'package:app/src/constants/colors.dart';
import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';

class ListForm extends StatefulWidget {
  const ListForm({super.key, required this.totalEpisode});

  final int totalEpisode;

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  TextEditingController episodeField = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          "Completed",
          "Dropped",
          "On-hold",
          "Plans to watch"
        ];
    String scoreDropdownValue = scoreList.first,
        statusDropdownValue = statusList.first;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            DropdownMenu<String>(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
              initialSelection: scoreList.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  scoreDropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  scoreList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(
              width: 10,
            ),
            DropdownMenu<String>(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
              initialSelection: statusList.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  statusDropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  statusList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                  controller: episodeField,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Input your score",
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: (commonColors["secondColor"])!),
                    ),
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "/ ${widget.totalEpisode} eps",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
