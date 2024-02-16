import 'package:app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatefulWidget {
  const DescriptionText(
      {super.key, required this.description, required this.paddingSize});

  final String description;
  final double paddingSize;

  @override
  State<DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  bool status = false;
  String firstHalf = "", secondHalf = "";

  @override
  void initState() {
    super.initState();

    if (widget.description.length > 50) {
      firstHalf = widget.description.substring(0, 50);
      secondHalf = widget.description.substring(50, widget.description.length);
    } else {
      firstHalf = widget.description;
      secondHalf = "";
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
              !status ? '$firstHalf...' : '$firstHalf$secondHalf',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
