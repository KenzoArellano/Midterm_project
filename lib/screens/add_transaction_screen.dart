import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddTransactionScreen extends HookWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = useTextEditingController();
    final TextEditingController descriptionController = useTextEditingController();

   
    final selectedTransactionType = useState('Income'); 

    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            const SizedBox(height: 10),

          
            DropdownButton<String>(
              value: selectedTransactionType.value,
              onChanged: (String? newValue) {
                selectedTransactionType.value = newValue!;
              },
              items: <String>['Income', 'Expense']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final description = descriptionController.text;
                final amount = amountController.text;
                final type = selectedTransactionType.value;

                Navigator.pop(context, {
                  'type': type,
                  'description': description,
                  'amount': amount,
                });
              },
              child: const Text('Save Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
