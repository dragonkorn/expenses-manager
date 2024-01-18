import 'package:flutter/material.dart';

class SwitchInput extends StatefulWidget {
  @override
  _SwitchInputState createState() => _SwitchInputState();
}

class _SwitchInputState extends State<SwitchInput> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Expenses'),
        Switch(
          value: _value,
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
        ),
        const Text('Income'),
      ],
    );
  }
}
