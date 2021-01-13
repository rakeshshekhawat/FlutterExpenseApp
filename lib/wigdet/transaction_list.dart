import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
//import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});
  //ListView Builder example to improve performance
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Container(
              child: Column(
                children: <Widget>[
                  const Text('No transactions added yet!!'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              //itembuilder with listview more better widget
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    '${transactions[index].title}',
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete!!!'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );

              //itembuilder with card setup
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin:
              //             EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor),
              //         ),
              //       ),
              //       Container(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               transactions[index].title,
              //               // ignore: deprecated_member_use
              //               style: Theme.of(context).textTheme.title,
              //             ),
              //             Text(
              //               DateFormat.yMMMEd()
              //                   .format(transactions[index].date),
              //               style: TextStyle(
              //                   fontSize: 15,
              //                   color: Colors.grey,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // );
            },
            itemCount: transactions.length,
            //children: transactions.map((tx) {}).toList(),
          );
  }

//ListView Example Alternative of SingleChildScrolView this used when you
//know how long is list if don't it'll make performance issues

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 250,
  //     child: ListView(
  //       children: transactions.map((tx) {
  //         return Card(
  //           child: Row(
  //             children: <Widget>[
  //               Container(
  //                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(
  //                     color: Colors.purple,
  //                     width: 2,
  //                   ),
  //                 ),
  //                 padding: EdgeInsets.all(10),
  //                 child: Text(
  //                   '\$${tx.amount}',
  //                   style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 20,
  //                       color: Colors.purple),
  //                 ),
  //               ),
  //               Container(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       tx.title,
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 20,
  //                           color: Colors.purple),
  //                     ),
  //                     Text(
  //                       DateFormat.yMMMEd().format(tx.date),
  //                       style: TextStyle(
  //                           fontSize: 15,
  //                           color: Colors.grey,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

//SingleChild View Example without main.dart & with container
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 250,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: transactions.map((tx) {
  //           return Card(
  //             child: Row(
  //               children: <Widget>[
  //                 Container(
  //                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
  //                   decoration: BoxDecoration(
  //                     border: Border.all(
  //                       color: Colors.purple,
  //                       width: 2,
  //                     ),
  //                   ),
  //                   padding: EdgeInsets.all(10),
  //                   child: Text(
  //                     '\$${tx.amount}',
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 20,
  //                         color: Colors.purple),
  //                   ),
  //                 ),
  //                 Container(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       Text(
  //                         tx.title,
  //                         style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 20,
  //                             color: Colors.purple),
  //                       ),
  //                       Text(
  //                         DateFormat.yMMMEd().format(tx.date),
  //                         style: TextStyle(
  //                             fontSize: 15,
  //                             color: Colors.grey,
  //                             fontWeight: FontWeight.bold),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }
}
