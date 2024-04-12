import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/series/widget/list_episodes.dart';
import 'package:app/src/features/series/widget/list_relation.dart';
import 'package:app/src/models/episodes.dart';
import 'package:app/src/models/series.dart';
import 'package:flutter/material.dart';

class TabMenu extends StatefulWidget {
  const TabMenu(
      {super.key,
      required this.episodes,
      required this.paddingSize,
      required this.duration,
      required this.relation});

  final List<Episode> episodes;
  final double paddingSize;
  final int duration;
  final List<Relation> relation;

  @override
  State<TabMenu> createState() => TabMenuState();
}

class TabMenuState extends State<TabMenu> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int itemsLength = widget.episodes.length;
    return SizedBox(
      height: itemsLength > 0
          ? (MediaQuery.of(context).size.height * itemsLength) / 5
          : 300,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: commonColors["secondColor"],
            tabs: const [
              Text(
                "List Episodes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Relations",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                widget.episodes.isNotEmpty
                    ? ListEpisodes(
                        episodes: widget.episodes,
                        paddingSize: widget.paddingSize,
                        duration: widget.duration)
                    : const Center(
                        child: Text(
                          "This series doesn't have any episode yet.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                widget.relation.isNotEmpty
                    ? ListRelation(
                        relations: widget.relation,
                        paddingSize: widget.paddingSize)
                    : const Center(
                        child: Text(
                          "This series doesn't have any relation yet.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
