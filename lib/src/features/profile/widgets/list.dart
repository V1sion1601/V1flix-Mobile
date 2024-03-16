import 'package:app/src/features/profile/screens/list_user.dart';
import 'package:app/src/models/series.dart';
import 'package:app/src/models/users.dart';
import 'package:flutter/material.dart';

class ListsSection extends StatelessWidget {
  const ListsSection({super.key, required this.list});

  final List<UserList> list;

  @override
  Widget build(BuildContext context) {
    List<String> statusList = ["All", "Completed"];
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
                                status: item,
                              )));
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  color: Colors.greenAccent[500],
                  child: Center(
                    child: Text(
                      item,
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
