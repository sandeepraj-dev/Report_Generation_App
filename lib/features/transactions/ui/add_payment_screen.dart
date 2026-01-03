import 'package:flutter/material.dart';
import '../models/payment_model.dart';
import '../data/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPaymentScreen extends StatelessWidget {
  final String txnId;
  AddPaymentScreen({super.key, required this.txnId});

  final amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: amountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Payment Amount"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Save Payment"),
              onPressed: () async {
                final payment = PaymentModel(
                  amount: double.parse(amountCtrl.text),
                  mode: "CASH",
                  createdAt: Timestamp.now(),
                );

                await TransactionRepository().addPayment(txnId, payment);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
