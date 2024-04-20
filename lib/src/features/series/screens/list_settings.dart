import 'package:app/src/features/series/widget/list/detail_list_header.dart';
import 'package:app/src/features/series/widget/list/list_form.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class ListSettings extends StatefulWidget {
  const ListSettings({super.key,
    required this.currentUserScore,
    required this.currentUserStatus,
    required this.currentUserEpisode,
    required this.series});

  final int currentUserScore, currentUserEpisode;
  final String currentUserStatus;
  final Series series;

  @override
  State<ListSettings> createState() => _ListSettingsState();
}

class _ListSettingsState extends State<ListSettings> {
  TextEditingController score = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "List item",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 8, right: 8),
        children: [
          DetailListHeader(
            images: widget.series.images,
            title: widget.series.title,
            currentUserScore: widget.currentUserScore,
            currentUserStatus: widget.currentUserStatus,
          ),
          const SizedBox(height: 10,),
          ListForm(totalEpisode: widget.series.totalEpisodes ?? 0,
            seriesId: widget.series.id,
            currentEpisode: widget.currentUserEpisode.toString(),
            currentScore: widget.currentUserScore.toString(),
            title: widget.series.title.mainTitle,
            currentStatus: widget.currentUserStatus,)
        ],
      ),
    );
  }
}
