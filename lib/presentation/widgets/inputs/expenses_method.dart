import 'package:flutter/material.dart';

class ExpensesMethod extends StatefulWidget {
  const ExpensesMethod({Key? key, required this.onChanged}) : super(key: key);

  final void Function(String value) onChanged;

  @override
  State<ExpensesMethod> createState() => _ExpensesMethodState();
}

class _ExpensesMethodState extends State<ExpensesMethod> {
  String? selectedOption = '1';

  void _onChanged(String value) {
    setState(() {
      selectedOption = value;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRadioItem('Transfer', '1'),
        _buildRadioItem('Credit-Card', '2'),
        _buildRadioItem('Cash', '3'),
        _buildRadioItem('Others', '0'),
      ],
    );
  }

  Widget _buildRadioItem(String label, String value) {
    return InkWell(
      onTap: () {
        _onChanged(value);
      },
      child: ListTile(
        title: Text(label),
        leading: Radio<String>(
          value: value,
          groupValue: selectedOption,
          onChanged: (value) {
            _onChanged(value!);
          },
        ),
      ),
    );
  }
}
