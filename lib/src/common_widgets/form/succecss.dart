import 'package:flutter/material.dart';

class SuccessForm extends StatelessWidget {
  const SuccessForm({super.key, required this.success});

  final String success;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.green[200],
        child: Padding(
            padding:
                const EdgeInsets.only(left: 3, right: 3, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.green[600],
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  success,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.green[800],
                      fontWeight: FontWeight.normal),
                ),
              ],
            )),
      ),
    );
  }
}
