import 'package:app/src/common_widgets/form/error.dart';
import 'package:app/src/common_widgets/form/succecss.dart';
import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/series/models/list_settings.dart';
import 'package:app/src/features/series/services/update_user_list.dart';
import 'package:app/src/features/series/widget/list_series_inputs.dart';
import 'package:app/src/globals/user_data.dart';
import 'package:app/src/models/form.dart';
import 'package:flutter/material.dart';


class ListForm extends StatefulWidget {
  const ListForm({super.key,
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
  FormResult result = FormResult(error: "", result: false);
  UpdateUserListService updateUserListService = UpdateUserListService();

  void setEpisode(int currentNumber) {
    setState(() {
      _currentEpisode = currentNumber;
    });
  }

  void setScore(String score) {
    setState(() {
      scoreDropdownValue = score;
    });
  }

  void setStatus(String status) {
    setState(() {
      statusDropdownValue = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListSeriesInputs(currentScore: widget.currentScore,
            currentStatus: widget.currentStatus,
            currentEpisode: int.parse(widget.currentEpisode),
            setEpisode: setEpisode,
            setStatus: setStatus,
            setScore: setScore),
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
              if (episode <= 0 || episode > widget.totalEpisode) {
                setState(() {
                  result = FormResult(
                      error: "Input Error!",
                      result: false,
                      message:
                      "The current episode can't be greater than total episode.");
                });
                return;
              }

              if(statusDropdownValue == "") {
                setState(() {
                  result = FormResult(
                      error: "Input Error!",
                      result: false,
                      message:
                      "Status mustn't be emptied .");
                });
              }

              ListInput listData = ListInput(
                  userId: GlobalUserData().loggedUser.id,
                  score: scoreDropdownValue ?? widget.currentScore,
                  status: statusDropdownValue ?? widget.currentStatus,
                  currentEpisode: episode.toString(),
                  seriesId: widget.seriesId);
              FormResult listResult = await updateUserListService
                  .updateUserList(listData: listData);
              await updateUserListService.updateScore(listData: listData);
              setState(() {
                result = listResult;
              });
              /*Temp solution*/
              if (result.result) {
                Navigator.pop(context);
              }
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
