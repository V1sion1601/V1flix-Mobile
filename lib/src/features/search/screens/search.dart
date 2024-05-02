import 'package:app/src/features/search/services/search.dart';
import 'package:app/src/features/search/widgets/genres_bar.dart';
import 'package:app/src/features/search/widgets/list_result.dart';
import 'package:app/src/features/search/widgets/search_header.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String keyword = "";
  late bool loading = true;
  final ListResultService _listResultService = ListResultService();
  List<Series> _results = [];

  @override
  void initState() {
    super.initState();

    _load();
  }

  void _load() async {
    _results = await _listResultService.getResult(keyword: "");
    setState(() {
      loading = false;
    });
  }

  void setKeyword(String keyword) async {
    print("Keyword: $keyword");
    List<Series> tempResults =
        await _listResultService.getResult(keyword: keyword);
    setState(() {
      _results = tempResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 25, right: 5, left: 5, bottom: 2),
        child: ListView(
          children: [
            SearchHeader(preContext: context, setKeyword: setKeyword),
            const SizedBox(
              height: 10,
            ),
            const GenresBar(),
            const SizedBox(
              height: 10,
            ),
           ListResult(listResult: _results)
          ],
        ),
      ),
    );
  }
}
