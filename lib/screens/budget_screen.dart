import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Monthly Budget: \$2000.00'),
            Text('Spent: \$1050.00'),
            Text('Remaining: \$950.00'),
          ],
        ),
      ),
    );
  }
}
