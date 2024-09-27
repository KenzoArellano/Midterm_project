import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; 

void main() {
  runApp(const MoneyManagementApp());
}

class MoneyManagementApp extends StatelessWidget {
  const MoneyManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
