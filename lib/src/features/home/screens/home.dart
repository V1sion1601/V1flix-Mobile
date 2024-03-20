import 'package:app/src/features/home/screens/history.dart';
import 'package:app/src/features/home/widgets/currently_watching.dart';
import 'package:app/src/globals/user_data.dart';
import 'package:flutter/material.dart';

//Widgets
import 'package:app/src/common_widgets/loading.dart';
import 'package:app/src/features/home/widgets/random_series_banner.dart';
import 'package:app/src/features/home/widgets/recommendations.dart';

//Services
import 'package:app/src/features/home/services/home.dart';

//Models
import 'package:app/src/models/series.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Series> _listRecommendation = [];
  Series _randomSeries = Series(id: "", title: SeriesTitle("", ""), images: []);
  final ListSeriesService _listSeriesService = ListSeriesService();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    _listRecommendation = await _listSeriesService.getRecommendation();
    _randomSeries = await _listSeriesService.getRandom();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return RefreshIndicator(
        onRefresh: () async {
          _load();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: (_listRecommendation.isNotEmpty && _randomSeries.id != '')
              ? ListView(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    RandomSeriesBanner(randomSeries: _randomSeries),
                    const SizedBox(height: 10),
                    GlobalUserData().currentlyWatching.isNotEmpty ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Currently Watching",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => HistoryPage(
                                  historyList:
                                      GlobalUserData().currentlyWatching,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ) : Container(),
                    GlobalUserData().currentlyWatching.isNotEmpty
                        ? const SizedBox(height: 10)
                        : Container(),
                    GlobalUserData().currentlyWatching.isNotEmpty
                        ? CurrentlyWatching(
                            episodeList: GlobalUserData().currentlyWatching)
                        : Container(),
                    const SizedBox(height: 10),
                    const Text(
                      "Recommendations",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    ListRecommendations(listSeries: _listRecommendation),
                    const SizedBox(height: 10),
                  ],
                )
              : const Loading(message: "Loading..."),
        ));
  }
}
