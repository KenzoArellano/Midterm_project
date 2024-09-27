import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  final List<String> expenseTransactions;

  const ExpenseScreen({Key? key, required this.expenseTransactions}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  void _removeExpenseTransaction(int index) {
    setState(() {
      widget.expenseTransactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Transactions')),
      body: widget.expenseTransactions.isEmpty
          ? const Center(child: Text('No current expenses.'))
          : ListView.builder(
              itemCount: widget.expenseTransactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.expenseTransactions[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _removeExpenseTransaction(index);
                    },
                  ),
                );
              },
            ),
    );
  }
}
