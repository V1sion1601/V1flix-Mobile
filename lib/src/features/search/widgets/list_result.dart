import 'package:app/src/features/search/widgets/search_card.dart';
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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: itemWidth / itemHeight,
      physics: const ScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: widget.listResult
          .map(
            (result) => Container(
              // margin: const EdgeInsets.all(10),
              child: SearchCard(
                images: result.images,
                title: result.title.mainTitle,
              ),
            ),
          )
          .toList(),
    );
  }
}
