import 'package:expense_planner/models/transction.dart';
import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transction.dart';

class Chart extends StatelessWidget {
  List<Transction> rtransction;
  Chart(this.rtransction);

  List<Map<String, Object>> get values {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.0;
      for (var i = 0; i < rtransction.length; i++) {
        if (rtransction[i].date.day == weekday.day &&
            rtransction[i].date.month == weekday.month &&
            rtransction[i].date.year == weekday.year) {
          totalsum += rtransction[i].amount;
        }
      }
      return ({'day': DateFormat.E().format(weekday), 'amount': totalsum});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: values.map((e) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              label: e['day'].toString(),
              spendAmount: (e['amount'] as double),
              spendAmountPer:
                  totalSpend == 0 ? 0 : (e['amount'] as double) / totalSpend,
            ),
          );
        }).toList(),
      ),
    );
  }

  double get totalSpend {
    return values.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }
}
