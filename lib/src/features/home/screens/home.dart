import 'package:app/src/features/home/services/list_series.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Series>? _listSeries;
  final ListSeriesService _listSeriesService = ListSeriesService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  void _load() async {
      _listSeries = null;
      _listSeries = await _listSeriesService.getRecommendation();
      setState(() {
      });
      print("List series: ");
      print(_listSeries);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("Hello world"),
    );
  }
}