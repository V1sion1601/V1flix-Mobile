import 'package:app/src/features/series/widget/description.dart';
import 'package:app/src/features/series/widget/list_button.dart';
import 'package:app/src/features/series/widget/tab_menu.dart';
import 'package:app/src/features/series/widget/user_series_details.dart';
import 'package:app/src/globals/user_data.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/models/users.dart';
import 'package:app/src/utils/find_source.dart';
import 'package:flutter/material.dart';

//Widgets
import 'package:app/src/common_widgets/loading.dart';
import 'package:app/src/features/series/widget/action_button.dart';
import 'package:app/src/features/series/widget/content_header.dart';
import 'package:app/src/features/series/widget/video_trailer.dart';

//Services
import 'package:app/src/features/series/services/detail_series.dart';

//Models
import 'package:app/src/models/series.dart';
import 'package:flutter/services.dart';
import 'package:app/src/models/source.dart';

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
  late Source source = Source(id: "", value: "", kind: "");
  late int epNum = 1, currentUserScore = 0, currentUserEpisode;
  late String title = "", currentUserStatus = "";
  late Episode episode;

  @override
  void initState() {
    super.initState();

    _load();
  }

  void _load() async {
    _detailSeries =
        await _detailSeriesService.getDetails(title: widget.seriesTitle);
    if (_detailSeries.rating!.isNotEmpty &&
        GlobalUserData().loggedUser.username != '') {
      Iterable<Rating> rating = _detailSeries.rating!.where((rating) =>
          rating.user.username == GlobalUserData().loggedUser.username);
      if (rating.isNotEmpty) {
        currentUserScore = rating.first.score;

        UserList currentUser = rating.first.user.userList!
            .where((series) => series.series.id == _detailSeries.id)
            .first;
        print("Current episode of user: " + currentUser.currentEp.toString());
        currentUserEpisode = currentUser.currentEp;
        currentUserStatus = currentUser.status;
      }
    }
    if (_detailSeries.episodes!.isNotEmpty) {
      Episode currentUserEpisodeHistory = GlobalUserData()
          .currentlyWatching
          .firstWhere(
              (episode) =>
                  episode.series?.title.mainTitle ==
                  _detailSeries.title.mainTitle,
              orElse: () => Episode(id: "", title: "", epNum: 1));

      if (currentUserEpisodeHistory.id != "") {
        source =
            handleSource(currentUserEpisodeHistory.sources as List<Source>);
        epNum = currentUserEpisodeHistory.epNum;
        title = currentUserEpisodeHistory.title;
        episode = currentUserEpisodeHistory;
      } else {
        title = _detailSeries.episodes!.first.title;
        epNum = _detailSeries.episodes!.first.epNum;
        source =
            handleSource(_detailSeries.episodes!.first.sources as List<Source>);
        episode = _detailSeries.episodes!.first;
      }
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: (loading)
          ? const Loading(message: "Getting data")
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                VideoTrailer(trailer: _detailSeries.trailer?.first),
                const SizedBox(height: 10),
                ContentHeader(
                  series: _detailSeries,
                ),
                const SizedBox(height: 10),
                GlobalUserData().loggedUser.username != ''
                    ? Row(
                        children: [
                          currentUserScore != 0
                              ? UserSeriesDetails(
                                  currentUserScore: currentUserScore,
                                  currentUserStatus: currentUserStatus,
                                )
                              : Container(),
                          currentUserScore != 0
                              ? const SizedBox(width: 5)
                              : Container(),
                          ListButton(
                            currentUserScore: currentUserScore,
                            currentUserStatus: currentUserStatus,
                            series: _detailSeries,
                            currentUserEpisode: currentUserEpisode,
                          )
                        ],
                      )
                    : Container(),
                currentUserScore != 0
                    ? const SizedBox(height: 10)
                    : Container(),
                source.id != ''
                    ? ActionButton(
                        paddingSize: _paddingSize,
                        source: source,
                        title: title,
                        epNum: epNum,
                        episode: episode)
                    : Container(),
                source.id != '' ? const SizedBox(height: 10) : Container(),
                DescriptionText(
                    description: _detailSeries.description ?? "",
                    paddingSize: _paddingSize),
                const SizedBox(height: 10),
                TabMenu(
                  episodes: _detailSeries.episodes ?? [],
                  paddingSize: _paddingSize,
                  duration: _detailSeries.duration ?? 0,
                  relation: _detailSeries.relation ?? [],
                )
              ],
            ),
    );
  }
}
