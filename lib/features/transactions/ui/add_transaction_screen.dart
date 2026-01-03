import 'package:flutter/material.dart';
import '../data/transaction_repository.dart';
import 'add_item_screen.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Transaction")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Create New Bill"),
          onPressed: () async {
            final repo = TransactionRepository();
            final txnId = await repo.createTransaction();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddItemScreen(txnId: txnId)),
            );
          },
        ),
      ),
    );
  }
}
