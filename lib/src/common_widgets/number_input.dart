import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputWithIncrementDecrement extends StatefulWidget {
  const NumberInputWithIncrementDecrement({super.key, this.initialText, required this.width, required this.setNumber});
  final double width;
  final void Function(int) setNumber;
  final String? initialText;

  @override
  _NumberInputWithIncrementDecrementState createState() =>
      _NumberInputWithIncrementDecrementState();
}

class _NumberInputWithIncrementDecrementState
    extends State<NumberInputWithIncrementDecrement> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialText ?? "0"; // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width - 40,
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.blueGrey,
            width: 2.0,
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 70,
                child: TextFormField(
                  onChanged: (String result) {
                    if(result == "") return;
                    _controller.text = result;
                    widget.setNumber(int.parse(result));
                  },
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 10),
                     border: InputBorder.none
                  ),
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: InkWell(
                      child: const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onTap: () {
                        int currentValue = int.parse(_controller.text) + 1;
                        setState(() {

                          widget.setNumber(currentValue);
                          _controller.text =
                              (currentValue).toString(); // incrementing value
                        });
                      },
                    ),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onTap: () {
                      int currentValue = int.parse(_controller.text) + 1;
                      setState(() {

                        widget.setNumber(currentValue);
                        _controller.text = (currentValue > 0 ? currentValue : 0)
                            .toString(); // decrementing value
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
