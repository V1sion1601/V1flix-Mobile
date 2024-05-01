import 'package:app/src/constants/colors.dart';
import 'package:app/src/extensions/format_string.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatefulWidget {
  const DescriptionText(
      {super.key, required this.description, required this.paddingSize, required this.screenWidth});

  final String description;
  final double paddingSize;
  final double screenWidth;

  @override
  State<DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  bool status = false;
  String truncatedString = "";

  @override
  void initState() {
    super.initState();

    if (widget.description.length > 50) {
      truncatedString = widget.description.truncate(widget.screenWidth);
    } else {
      truncatedString = widget.description;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: widget.paddingSize, right: widget.paddingSize),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => {
              setState(() {
                status = !status;
              })
            },
            child:  Text(
              !status ? truncatedString : widget.description,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
