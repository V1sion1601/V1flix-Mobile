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
    return GridView.builder(
      itemCount: widget.listResult.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: SearchCard(
            images: widget.listResult[index].images,
            title: widget.listResult[index].title.mainTitle,
          ),
        );
      },
    );
  }
}
