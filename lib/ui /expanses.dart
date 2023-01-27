import '../ui /chart.dart';
import 'package:expanses/ui%20/transcation_list.dart';

import '../ui /new_transcation.dart';

import 'package:intl/intl.dart';

import '../models/transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // late String titleinput;
  // late String amountinput;

  final List<Transcation> transcations = [
    // Transcation(id: "t1", title: "ok", amount: 99.99, datetime: DateTime.now())
  ];

  List<Transcation> get _recentTranscation {
    return transcations.where((tx) {
      return tx.datetime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTranscation(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transcation(
        title: txTitle,
        amount: txAmount,
        datetime: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      transcations.add(newTx);
    });
  }

  void _deleteTranscation(String id) {
    setState(() {
      transcations.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void startAddNewTranscation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            onTap: () {},
            child: NewTranscation(_addNewTranscation),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTranscation(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(recentTranscations: _recentTranscation),
              TranscationList(transcations, _deleteTranscation)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => startAddNewTranscation(context),
      ),
    );
  }
}
