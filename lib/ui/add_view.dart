import 'package:flutter/material.dart';
import 'package:test_crypto/net/flutterfire.dart';

class AddView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    'bitcoin',
    'ethereum',
    'tether',
  ];

  String dropDownValue = 'bitcoin';
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //...coins.map((e) => Text(e)).toList(),
        DropdownButton(
          items: coins.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              dropDownValue = value!;
            });
          },
          value: dropDownValue,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Coin amount',
            ),
          ),
        ),
        MaterialButton(
          onPressed: () async {
            // to do
            await addCoin(dropDownValue, _amountController.text);
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        )
      ],
    ));
  }
}
