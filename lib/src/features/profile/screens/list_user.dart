import 'package:app/src/common_widgets/series/home_series_card.dart';
import 'package:app/src/extensions/format_string.dart';
import 'package:app/src/features/profile/widgets/user_series_stats.dart';
import 'package:app/src/models/users.dart';
import 'package:flutter/material.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage(
      {super.key,
      required this.list,
      required this.status,
      required this.username});

  final List<UserList> list;
  final String status;
  final String username;

  @override
  State<ListUserPage> createState() => _ListUserState();
}

class _ListUserState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    List<UserList> filteredList = widget.list;

    if (widget.status != "All") {
      filteredList = widget.list.where((series) {
        return series.status.capitalize() == widget.status;
      }).toList();
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: kToolbarHeight - 20, left: 23, right: 13),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.status,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            filteredList.isEmpty
                ? Center(
                    child: Text(
                      "This user doesn't have any series in ${widget.status}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  )
                : GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    childAspectRatio: (50 / 80),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 3,
                    children: filteredList.map((userSeries) {
                      int? rating = userSeries.series.rating
                          ?.where((rating) =>
                              rating.user.username == widget.username)
                          .first
                          .score;
                      return Column(children: [
                        Expanded(
                          flex: 2,
                          child: HomeSeriesCard(
                              images: userSeries.series.images,
                              index: 0,
                              rating: false,
                              title: userSeries.series.title.mainTitle),
                        ),
                        const SizedBox(height: 5,),
                        UserSeriesStats(
                            rating: rating ?? -1,
                            currentEpisode: userSeries.currentEp,
                            totalEpisode: userSeries.series.totalEpisodes ?? -1)
                      ]);
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
