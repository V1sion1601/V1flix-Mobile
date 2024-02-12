import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader(
      {super.key, required this.preContext, required this.setKeyword});

  final BuildContext preContext;
  final void Function(String) setKeyword;

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final borderLine = const BorderSide(color: Colors.white, width: 1);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          onPressed: () => {Navigator.pop(widget.preContext)},
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 80,
          decoration: BoxDecoration(
            border: Border(
                left: borderLine,
                top: borderLine,
                right: borderLine,
                bottom: borderLine),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () => {Navigator.pop(widget.preContext)},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (text) {
                    widget.setKeyword(text);
                  },
                  decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: 'Enter a search term',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
