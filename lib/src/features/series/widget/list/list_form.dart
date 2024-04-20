import 'package:app/src/common_widgets/form/error.dart';
import 'package:app/src/common_widgets/form/succecss.dart';
import 'package:app/src/features/series/widget/list/list_buttons.dart';
import 'package:app/src/features/series/widget/list/list_series_inputs.dart';
import 'package:app/src/models/form.dart';
import 'package:flutter/material.dart';


class ListForm extends StatefulWidget {
  const ListForm({super.key,
    required this.totalEpisode,
    required this.seriesId,
    required this.currentStatus,
    required this.currentScore,
    required this.currentEpisode, required this.title});

  final int totalEpisode;
  final String seriesId, currentScore, currentEpisode, currentStatus, title;

  @override
  State<ListForm> createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  TextEditingController episodeField = TextEditingController();
  int? _currentEpisode;
  String? scoreDropdownValue, statusDropdownValue;
  FormResult result = FormResult(error: "", result: false);


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

  void setResult(FormResult formResult) {
    setState(() {
      result = formResult;
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
          child: ListButtons(title: widget.title, currentEpisode: _currentEpisode , currentScore: widget.currentScore, currentStatus: widget.currentStatus, scoreDropdownValue: scoreDropdownValue, totalEpisode: widget.totalEpisode, seriesId: widget.seriesId, statusDropdownValue: statusDropdownValue, setResult: setResult),
        ),
      ],
    );
  }
}
