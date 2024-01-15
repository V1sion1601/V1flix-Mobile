import 'package:app/src/common_widgets/loading.dart';
import 'package:app/src/features/home/services/home.dart';
import 'package:app/src/features/home/widgets/random_series_banner.dart';
import 'package:app/src/features/home/widgets/recommendations.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Series> _listRecommendation = [];
  late Series _randomSeries;
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
    return RefreshIndicator(
        onRefresh: () async {
          _load();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: _listRecommendation.isEmpty
              ? const Loading(message: "Loading...")
              : ListView(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    RandomSeriesBanner(randomSeries: _randomSeries),
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
                    ListRecommendations(listSeries: _listRecommendation)
                  ],
                ),
        ));
  }
}
