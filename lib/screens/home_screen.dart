import 'package:flutter/material.dart';
import 'income_screen.dart';
import 'expense_screen.dart';
import 'add_transaction_screen.dart';
import 'profile_screen.dart';

const Color darkGreen = Color(0xFF004d00); // Define dark green background color
const Color darkYellow = Color(0xFFD8A800); // Define dark yellow color for buttons

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _incomeTransactions = [];
  List<String> _expenseTransactions = [];

  void _addTransaction(String type, String description, String amount) {
    setState(() {
      if (type == 'Income') {
        _incomeTransactions.add('$description: +\$$amount');
      } else if (type == 'Expense') {
        _expenseTransactions.add('$description: -\$$amount');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      appBar: AppBar(
        title: const Text('Money Management \$ NAKO'), 
        backgroundColor: Colors.green[800], 
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                SizedBox(
                  width: 150,  
                  height: 100, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkYellow, 
                      shape: const RoundedRectangleBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IncomeScreen(incomeTransactions: _incomeTransactions),
                        ),
                      );
                    },
                    child: const Text(
                      'View Income',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 16, 
                      ),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                ),

                const SizedBox(height: 24),

               
                SizedBox(
                  width: 150,  
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkYellow, 
                      shape: const RoundedRectangleBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpenseScreen(expenseTransactions: _expenseTransactions),
                        ),
                      );
                    },
                    child: const Text(
                      'View Expense',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 16, 
                      ),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                ),

                const SizedBox(height: 24),

               
                SizedBox(
                  width: 150, 
                  height: 100, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkYellow, 
                      shape: const RoundedRectangleBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      ),
                    ),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTransactionScreen(),
                        ),
                      );

                      if (result != null) {
                        _addTransaction(result['type'], result['description'], result['amount']);
                      }
                    },
                    child: const Text(
                      'Add Transaction',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 16, 
                      ),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                
                SizedBox(
                  width: 150, 
                  height: 100, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkYellow, 
                      shape: const RoundedRectangleBorder( 
                        borderRadius: BorderRadius.all(Radius.circular(10)), 
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileScreen()),
                      );
                    },
                    child: const Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 16, 
                      ),
                      textAlign: TextAlign.center, 
                    ),
                  ),
                ),
              ],
            ),
          ),

          
          Expanded(
            child: Center(
              child: const Text(
                'Account Balance: \$1200.00',
                style: TextStyle(fontSize: 24, color: Colors.white), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
