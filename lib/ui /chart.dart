// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expanses/ui%20/chart_bar.dart';
import 'package:flutter/material.dart';

import 'package:expanses/models/transcation.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transcation> recentTranscations;
  Chart({required this.recentTranscations});

  List<Map<String, Object>> get groupedTranscationValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalsum = 0.0;

      for (var i = 0; i < recentTranscations.length; i++) {
        if (recentTranscations[i].datetime.day == weekDay.day &&
            recentTranscations[i].datetime.month == weekDay.month &&
            recentTranscations[i].datetime.year == weekDay.year) {
          totalsum += recentTranscations[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTranscationValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTranscationValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTranscationValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'] as String,
                  data['amount'] as double,
                  maxSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
