import 'package:flutter/material.dart';

class ListsSection extends StatelessWidget {
  const ListsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(8),
            color: Colors.greenAccent[500],
            child: const Center(
                child: Text(
              "All",
              style: textStyle,
            )),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(8),
            color: Colors.green[500],
            child: const Center(
                child: Text(
              "Completed",
              style: textStyle,
            )),
          ),
        ),
      ],
    );
  }
}
