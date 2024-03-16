import 'package:app/src/common_widgets/series/home_series_card.dart';
import 'package:app/src/extensions/format_string.dart';
import 'package:app/src/models/users.dart';
import 'package:flutter/material.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key, required this.list, required this.status});

  final List<UserList> list;
  final String status;

  @override
  State<ListUserPage> createState() => _ListUserState();
}

class _ListUserState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    List<UserList> filteredList = widget.list;
    if (widget.status != "All") {
      filteredList = widget.list.where((series) {
        print(series.status.capitalize() == widget.status);
        return series.status.capitalize() == widget.status;
      }).toList();
      print("Filtered Length: " + filteredList.length.toString());
    }
    return Scaffold(
        body: Padding(
      padding:
          const EdgeInsets.only(top: kToolbarHeight - 20, left: 20, right: 10),
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
          GridView.count(
            primary: false,
            shrinkWrap: true,
            childAspectRatio: (50 / 100),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: filteredList
                .map((userSeries) => Expanded(
                    flex: 1,
                    child: HomeSeriesCard(
                        images: userSeries.series.images, title: userSeries.series.title.mainTitle)))
                .toList(),
          ),
        ],
      ),
    ));
  }
}
