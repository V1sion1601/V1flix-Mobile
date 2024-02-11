import 'package:app/src/features/search/widgets/search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 25, right: 2, left: 2, bottom: 2),
        child: Column(
          children: [
            SearchHeader(preContext: context),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Test",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
