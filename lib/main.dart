import 'package:expense_planner/models/transction.dart';
import 'package:expense_planner/widgets/chart.dart';
import 'package:expense_planner/widgets/new_transction.dart';
import 'package:expense_planner/widgets/transction_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.purple),
    title: "Expense_planner",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transction> transction = [
    // Transction(
    //   id: '1',
    //   title: 'shoes',
    //   amount: 2500,
    //   date: DateTime.now(),
    // ),
    // Transction(
    //   id: '2',
    //   title: 'Bag',
    //   amount: 1500,
    //   date: DateTime.now(),
    // ),
  ];
  List<Transction> get values {
    return transction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void inputMethod(String titletx, double amounttx, DateTime datepicker) {
    final tx = Transction(
      title: titletx,
      amount: amounttx,
      id: DateTime.now().toString(),
      date: datepicker,
    );
    setState(() {
      transction.add(tx);
    });
  }

  void inputFunction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransction(
            inputMethod,
          );
        });
  }

  void deleteFunction(String id) {
    setState(() {
      transction.removeWhere((element) => element.id == id);
    });
  }

  // late String inputTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () => inputFunction(context),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => inputFunction(context),
              icon: Icon(
                Icons.add,
                size: 35,
              ))
        ],
        centerTitle: true,
        title: Text("Expense Planner"),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              color: Colors.blue,
              child: Chart(values),
            ),
          ),
          TransctionList(transction, deleteFunction)
        ],
      ),
    );
  }
}
