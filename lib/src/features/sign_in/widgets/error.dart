import 'package:flutter/material.dart';

class ErrorSignIn extends StatelessWidget {
  const ErrorSignIn({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.pink[200],
        child: Padding(
            padding:
                const EdgeInsets.only(left: 3, right: 3, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red[600],
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  error,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red[800],
                      fontWeight: FontWeight.normal),
                ),
              ],
            )),
      ),
    );
  }
}
