import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Transactions extends StatelessWidget {
  final List<Transaction> _userTransactions;

  Transactions(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions is add!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  // child: Row(
                  //   children: <Widget>[
                  //     Container(
                  //       margin: EdgeInsets.symmetric(
                  //         vertical: 10,
                  //         horizontal: 15,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           color: Theme.of(context).primaryColor,
                  //           width: 2,
                  //         ),
                  //       ),
                  //       padding: EdgeInsets.all(10),
                  //       child: Text(
                  //         '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           color: Theme.of(context).primaryColor,
                  //         ),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(
                  //           _userTransactions[index].title,
                  //           style: Theme.of(context).textTheme.headline6,
                  //         ),
                  //         Text(
                  //           DateFormat.yMMMd()
                  //               .format(_userTransactions[index].date),
                  //           style: TextStyle(
                  //             color: Colors.grey,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              '\$${_userTransactions[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _userTransactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(_userTransactions[index].date)),
                  ),
                );
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}
