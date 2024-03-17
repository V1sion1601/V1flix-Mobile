import 'package:app/src/constants/colors.dart';
import 'package:app/src/features/profile/screens/list_user.dart';
import 'package:app/src/models/users.dart';
import 'package:flutter/material.dart';

class ListItem {
  final String statusName;
  final Color? color;

  ListItem({required this.statusName, required this.color});
}

class ListsSection extends StatelessWidget {
  const ListsSection({super.key, required this.list, required this.username});

  final List<UserList> list;
  final String username;
  @override
  Widget build(BuildContext context) {
    List<ListItem> statusList = [
      ListItem(statusName: "All", color: Colors.grey[600]),
      ListItem(statusName: "Completed", color: commonColors["secondColor"]),
      ListItem(statusName: "Watching", color: Colors.green[600]),
      ListItem(statusName: "On-hold", color: Colors.yellow[600]),
      ListItem(statusName: "Dropped", color: Colors.red[600]),
      ListItem(statusName: "Plans to watch", color: Colors.white12)
    ];
    const textStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      childAspectRatio: (100 / 50),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: statusList
          .map(
            (item) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ListUserPage(
                                list: list,
                                status: item.statusName,
                                username: username,
                              )));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  color: item.color,
                  child: Center(
                    child: Text(
                      item.statusName,
                      style: textStyle,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
