import 'package:app/src/features/series/widget/series/relation_card.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class ListRelation extends StatelessWidget {
  const ListRelation({
    super.key,
    required this.relations,
    required this.paddingSize,
  });

  final List<Relation> relations;
  final double paddingSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: paddingSize, right: paddingSize, top: paddingSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: relations
            .map((relation) => RelationCard(
                  relation: relation,
                ))
            .toList(),
      ),
    );
  }
}
