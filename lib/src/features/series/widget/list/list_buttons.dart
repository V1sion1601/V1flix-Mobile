import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/series/models/list_settings.dart';
import 'package:app/src/features/series/screens/series.dart';
import 'package:app/src/features/series/services/update_user_list.dart';
import 'package:app/src/globals/user_data.dart';
import 'package:app/src/models/form.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class ListButtons extends StatefulWidget {
  const ListButtons(
      {super.key,
      required this.title,
      required this.currentEpisode,
      required this.statusDropdownValue,
      required this.scoreDropdownValue,
      required this.totalEpisode,
      required this.seriesId,
      required this.currentScore,
      required this.currentStatus,
      required this.setResult});

  final int? currentEpisode;
  final int totalEpisode;
  final String? statusDropdownValue, scoreDropdownValue;
  final String seriesId, currentScore, currentStatus, title;
  final void Function(FormResult) setResult;

  @override
  State<ListButtons> createState() => _ListButtonsState();
}

class _ListButtonsState extends State<ListButtons> {
  UpdateUserListService updateUserListService = UpdateUserListService();

  @override
  Widget build(BuildContext context) {
    int episode = widget.currentEpisode ?? 1;

    bool checkInput() {
      if (episode <= 0 || episode > widget.totalEpisode) {
        widget.setResult(FormResult(
            error: "Input Error!",
            result: false,
            message:
                "The current episode can't be greater than total episode."));

        return false;
      }

      if (widget.scoreDropdownValue == "0") {
        widget.setResult(FormResult(
            error: "Input Error!",
            result: false,
            message: "Score can't be zero."));
        return false;
      }

      if (widget.statusDropdownValue == "") {
        widget.setResult(FormResult(
            error: "Input Error!",
            result: false,
            message: "Status mustn't be emptied."));
        return false;
      }
      return true;
    }

    return widget.currentScore == "0"
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              backgroundColor: Colors.green,
              minimumSize: const Size.fromHeight(
                  40), // fromHeight use double.infinity as width and 40 is the height
            ),
            onPressed: () async {
              bool check = checkInput();
              if(!check) return;
              ListInput listData = ListInput(
                  userId: GlobalUserData().loggedUser.id,
                  score: widget.scoreDropdownValue ?? widget.currentScore,
                  status: widget.statusDropdownValue ?? widget.currentStatus,
                  currentEpisode: episode.toString(),
                  seriesId: widget.seriesId);
              FormResult listResult = await updateUserListService
                  .addSeriesToList(listData: listData);
              /*Temp solution*/
              if (listResult.result) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) =>
                            SeriesPage(seriesTitle: widget.title)));
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          )
        : Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  backgroundColor: commonColors["secondColor"],
                  minimumSize: const Size.fromHeight(
                      40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () async {
                  bool check = checkInput();
                  if(!check) return;
                  ListInput listData = ListInput(
                      userId: GlobalUserData().loggedUser.id,
                      score: widget.scoreDropdownValue ?? widget.currentScore,
                      status:
                          widget.statusDropdownValue ?? widget.currentStatus,
                      currentEpisode: episode.toString(),
                      seriesId: widget.seriesId);
                  FormResult listResult = await updateUserListService
                      .updateUserList(listData: listData);
                  await updateUserListService.updateScore(listData: listData);
                  widget.setResult(listResult);
                  /*Temp solution*/
                  if (listResult.result) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>
                                SeriesPage(seriesTitle: widget.title)));
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
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(
                      40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () async {
                  FormResult listResult =
                      await updateUserListService.removeSeriesFromList(
                          userId: GlobalUserData().loggedUser.id,
                          seriesId: widget.seriesId);
                  widget.setResult(listResult);
                  /*Temp solution*/
                  if (listResult.result) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) =>
                                SeriesPage(seriesTitle: widget.title)));
                  }
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ],
          );
  }
}
