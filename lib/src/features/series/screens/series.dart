import 'package:app/src/features/series/widget/description.dart';
import 'package:flutter/material.dart';

//Widgets
import 'package:app/src/common_widgets/loading.dart';
import 'package:app/src/features/series/widget/action_button.dart';
import 'package:app/src/features/series/widget/content_header.dart';
import 'package:app/src/features/series/widget/video_trailer.dart';
import 'package:app/src/features/series/widget/list_episodes.dart';

//Services
import 'package:app/src/features/series/services/detail_series.dart';

//Models
import 'package:app/src/models/series.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key, required this.seriesTitle});

  final String seriesTitle;

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  late Series _detailSeries;
  final DetailSeriesService _detailSeriesService = DetailSeriesService();
  final double _paddingSize = 5;
  late bool loading = true;

  @override
  void initState() {
    super.initState();

    _load();
  }

  void _load() async {
    _detailSeries =
        await _detailSeriesService.getDetails(title: widget.seriesTitle);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Loading(message: "Getting data")
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                VideoTrailer(trailer: _detailSeries.trailer),
                const SizedBox(height: 10),
                ContentHeader(
                  series: _detailSeries,
                ),
                const SizedBox(height: 10),
                ActionButton(paddingSize: _paddingSize),
                const SizedBox(height: 10),
                DescriptionText(description: _detailSeries.description ?? "", paddingSize: _paddingSize),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      EdgeInsets.only(left: _paddingSize, right: _paddingSize),
                  child: const Text(
                    "List Episodes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListEpisodes(
                  episodes: _detailSeries.episodes ?? [],
                  paddingSize: _paddingSize,
                  duration: _detailSeries.duration ?? 0,
                )
              ],
            ),
    );
  }
}
