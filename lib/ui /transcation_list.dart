import 'package:flutter/material.dart';
import '../models/transcation.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcations;
  final Function deletetx;
  TranscationList(this.transcations, this.deletetx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transcations.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transcations added yet!'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/FFXIV.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('￥${transcations[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transcations[index].title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transcations[index].datetime)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deletetx(transcations[index].id),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(children: <Widget>[
                //     Container(
                //       margin:
                //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //               color: Theme.of(context).primaryColor,
                //               width: 2.5)),
                //       padding: EdgeInsets.all(10),
                //       child: Text(
                //         "￥${transcations[index].amount}",
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           transcations[index].title,
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18,
                //               color: Colors.black),
                //         ),
                //         // Text(
                //         //   tx.id,
                //         //   style: TextStyle(color: Colors.green),
                //         // ),
                //         Text(
                //           DateFormat.yMMMMd('en_US')
                //               .format(transcations[index].datetime),
                //           style: TextStyle(color: Colors.grey),
                //         )
                //       ],
                //     )
                //   ]),
                // );
              },
              itemCount: transcations.length,
            ),
    );
  }
}
