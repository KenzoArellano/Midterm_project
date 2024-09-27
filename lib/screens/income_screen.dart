import 'package:flutter/material.dart';

class IncomeScreen extends StatefulWidget {
  final List<String> incomeTransactions;

  const IncomeScreen({Key? key, required this.incomeTransactions}) : super(key: key);

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  void _removeIncomeTransaction(int index) {
    setState(() {
      widget.incomeTransactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Income Transactions')),
      body: widget.incomeTransactions.isEmpty
          ? const Center(child: Text('No current income.'))
          : ListView.builder(
              itemCount: widget.incomeTransactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.incomeTransactions[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _removeIncomeTransaction(index);
                    },
                  ),
                );
              },
            ),
    );
  }
}
