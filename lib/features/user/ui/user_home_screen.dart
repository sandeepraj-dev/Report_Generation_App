import 'package:flutter/material.dart';
import '../../transactions/ui/transaction_list_screen.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Oil Broker")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TransactionListScreen()),
          );
        },
      ),
      body: const Center(child: Text("Welcome to Oil Brokerage App")),
    );
  }
}
