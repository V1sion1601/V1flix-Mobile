import 'package:flutter/material.dart';
import 'package:app/src/common_widgets/series/home_series_card.dart';
import 'package:app/src/features/series/screens/series.dart';
import '../../../models/series.dart';

class ListResult extends StatefulWidget {
  const ListResult({super.key, required this.listResult});

  final List<Series> listResult;

  @override
  State<ListResult> createState() => _ListResultState();
}

class _ListResultState extends State<ListResult> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: widget.listResult
            .map(
              (result) => InkWell(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => SeriesPage(seriesTitle: result.title.mainTitle)))
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: HomeSeriesCard(
                      images: result.images, title: result.title.mainTitle),
                ),
              ),
            )
            .toList());
  }
}
