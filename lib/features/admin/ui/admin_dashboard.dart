import 'package:flutter/material.dart';
import '../../transactions/ui/transaction_list_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),
      body: const TransactionListScreen(),
    );
  }
}
