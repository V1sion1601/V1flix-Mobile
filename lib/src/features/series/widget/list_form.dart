import 'package:app/src/common_widgets/number_input.dart';
import 'package:app/src/constants/colors.dart';
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
      "Completed",
      "Dropped",
      "On-hold",
      "Plans to watch"
    ];

class ListForm extends StatefulWidget {
  const ListForm(
      {super.key, required this.totalEpisode, required this.seriesId});

  final int totalEpisode;
  final String seriesId;

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  TextEditingController episodeField = TextEditingController();
  int _currentNumber = 0;
  String error = "";

  void setNumber(int currentNumber) {
    setState(() {
      _currentNumber = currentNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    ListUpdateResult result = ListUpdateResult(error: "", result: false);
    final UpdateUserListService updateUserListService = UpdateUserListService();

    double width = MediaQuery.of(context).size.width / 3;
    String? scoreDropdownValue, statusDropdownValue;
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
            width: width,
            controller: statusController,
            textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            initialSelection: statusList.first,
            onSelected: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                statusDropdownValue = value!;
                print("Status: $statusDropdownValue");
              });
            },
            dropdownMenuEntries:
                statusList.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
          const SizedBox(
            width: 10,
          ),
          NumberInputWithIncrementDecrement(width: width, setNumber: setNumber)
        ]),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: commonColors["secondColor"],
              minimumSize: const Size.fromHeight(
                  40), // fromHeight use double.infinity as width and 40 is the height
            ),
            onPressed: () async {
              print("Status: $statusDropdownValue");
              if (statusDropdownValue == null) return;
              /*Device is incompatible*/
              // ListInput listData = ListInput(
              //     userId: GlobalUserData().loggedUser.id,
              //     score: scoreDropdownValue ?? '',
              //     status: statusDropdownValue ?? '',
              //     currentEpisode: _currentNumber.toString(),
              //     seriesId: widget.seriesId);
              // result = await updateUserListService.updateUserList(listData: listData);
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
