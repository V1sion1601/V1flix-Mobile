import 'package:app/src/common_widgets/form/error.dart';
import 'package:app/src/common_widgets/form/succecss.dart';
import 'package:app/src/common_widgets/number_input.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/extensions/format_string.dart';
import 'package:app/src/features/series/models/list_settings.dart';
import 'package:app/src/features/series/services/update_user_list.dart';
import 'package:app/src/globals/user_data.dart';
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

class ListForm extends StatefulWidget {
  const ListForm(
      {super.key,
      required this.totalEpisode,
      required this.seriesId,
      required this.currentStatus,
      required this.currentScore,
      required this.currentEpisode});

  final int totalEpisode;
  final String seriesId, currentScore, currentEpisode, currentStatus;

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  TextEditingController episodeField = TextEditingController();
  int? _currentEpisode;
  String? scoreDropdownValue, statusDropdownValue;
  ListUpdateResult result = ListUpdateResult(error: "", result: false);

  void setNumber(int currentNumber) {
    setState(() {
      _currentEpisode = currentNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UpdateUserListService updateUserListService = UpdateUserListService();
    double width = MediaQuery.of(context).size.width / 3;
    // setState(() {
    //   scoreDropdownValue = widget.currentScore ?? "";
    //   statusDropdownValue = widget.currentStatus ?? "";
    //   _currentEpisode = int.parse(widget.currentEpisode);
    // });

    final TextEditingController scoreController = TextEditingController();
    final TextEditingController statusController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(children: [
          DropdownMenu<String>(
            width: width,
            controller: scoreController,
            textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            initialSelection: widget.currentScore,
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
            width: width,
            controller: statusController,
            textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            initialSelection: widget.currentStatus.toString(),
            onSelected: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                statusDropdownValue = value!;
              });
            },
            dropdownMenuEntries:
                statusList.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                  value: value, label: value.capitalize());
            }).toList(),
          ),
          const SizedBox(
            width: 10,
          ),
          NumberInputWithIncrementDecrement(
            width: width,
            setNumber: setNumber,
            initialText: widget.currentEpisode,
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        if (result.message != null && result.message != "" && !result.result)
          ErrorForm(error: result.message ?? ""),
        if (result.result)
          const SuccessForm(success: "Update series successfully"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              backgroundColor: commonColors["secondColor"],
              minimumSize: const Size.fromHeight(
                  40), // fromHeight use double.infinity as width and 40 is the height
            ),
            onPressed: () async {
              int episode = _currentEpisode ?? widget.totalEpisode;
              if (episode > widget.totalEpisode) {
                print("Show error in episode!");
                setState(() {
                  result = ListUpdateResult(
                      error: "Input Error!",
                      result: false,
                      message:
                          "The current episode can't be greater than total episode.");
                });
                return;
              }

              print("Current episode: " + _currentEpisode.toString());
              ListInput listData = ListInput(
                  userId: GlobalUserData().loggedUser.id,
                  score: scoreDropdownValue ?? widget.currentScore,
                  status: statusDropdownValue ?? widget.currentStatus,
                  currentEpisode: episode.toString(),
                  seriesId: widget.seriesId);
              ListUpdateResult listResult = await updateUserListService
                  .updateUserList(listData: listData);
              await updateUserListService.updateScore(listData: listData);
              setState(() {
                result = listResult;
              });
            },
            child: const Text(
              'Update',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }
}
