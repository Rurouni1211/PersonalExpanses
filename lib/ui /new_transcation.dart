import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscation extends StatefulWidget {
  final Function addTx;

  NewTranscation(this.addTx);

  @override
  State<NewTranscation> createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitData() {
    if (amountcontroller.text.isEmpty) {
      return;
    }
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);
    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDate == DateTime.now()) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
              // onChanged: (val) {
              //   titleinput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              // onChanged: (val) {
              //   amountinput = val;
              // },
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == DateTime.now()
                        ? 'No Date Chosen'
                        : DateFormat.yMd().format(_selectedDate)),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.blueAccent.shade700,
                    ),
                  )
                ],
              ),
            ),
            TextButton(
                onPressed: submitData,
                child: Text('Add Transcation',
                    style: TextStyle(color: Colors.purple)))
          ],
        ),
      ),
    );
  }
}
