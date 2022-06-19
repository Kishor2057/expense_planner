import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransction extends StatefulWidget {
  final Function functionValue;
  NewTransction(this.functionValue);

  @override
  State<NewTransction> createState() => _NewTransctionState();
}

class _NewTransctionState extends State<NewTransction> {
  final inputTitle = TextEditingController();

  final inputAmount = TextEditingController();
  DateTime? datepicker;

  void submitData() {
    final enterInput = inputTitle.text;
    final enterAmount = inputAmount.text;
    if (enterInput.isEmpty ||
        double.parse(enterAmount) <= 0 ||
        datepicker == null) {
      return;
    }

    widget.functionValue(
        inputTitle.text, double.parse(inputAmount.text), datepicker);
    Navigator.of(context).pop();
  }

  void DatePickerMethod() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        datepicker = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                onSubmitted: (_) => submitData,
                controller: inputTitle,
                // onChanged: (val) {
                //   inputTitle = val;
                // },
                decoration: InputDecoration(
                  labelText: "title",
                ),
              ),
              TextField(
                onSubmitted: (_) => submitData,
                keyboardType: TextInputType.number,
                controller: inputAmount,
                // onChanged: (val) {
                //   inputAmount = val;
                // },
                decoration: InputDecoration(
                  labelText: "amount",
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      datepicker == null
                          ? "No date selected"
                          : "date picked : ${DateFormat.yMd().format(datepicker!)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "Select Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: DatePickerMethod,
                  ),
                ],
              ),
              TextButton(
                child: Text(
                  "Add Transction",
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: submitData,

                // print(inputTitle);
                // print(inputAmount);
              ),
            ],
          ),
        ),
      ),
    );
  }
}
