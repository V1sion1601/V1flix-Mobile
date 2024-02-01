import 'package:app/src/features/latest/services/latest.dart';
import 'package:app/src/features/latest/widgets/latest_card.dart';
import 'package:app/src/models/episodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  List<Episode> _listLatest = [];
  final ListLatestEpisodes _listLatestEpisodes = ListLatestEpisodes();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    _listLatest = await _listLatestEpisodes.getLatestEpisode();
    print("----result");
    print(_listLatest[0]);
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
        child: ListView(
            children:
                _listLatest.map((ep) => LatestCard(episode: ep)).toList()),
      ),
    );
  }
}
