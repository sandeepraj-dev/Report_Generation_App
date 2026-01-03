import 'package:flutter/material.dart';
import '../models/transaction_item_model.dart';
import '../data/transaction_repository.dart';
import 'add_payment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddItemScreen extends StatefulWidget {
  final String txnId;
  const AddItemScreen({super.key, required this.txnId});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final oilCtrl = TextEditingController();
  final qtyCtrl = TextEditingController();
  final rateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Oil Item")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: oilCtrl,
              decoration: const InputDecoration(labelText: "Oil Type"),
            ),
            TextField(
              controller: qtyCtrl,
              decoration: const InputDecoration(labelText: "Quantity (KG)"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: rateCtrl,
              decoration: const InputDecoration(labelText: "Rate per KG"),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Add Item"),
              onPressed: () async {
                final item = TransactionItem(
                  id: '', // Firestore will generate real id
                  oilType: oilCtrl.text.trim(),
                  quantityKg: int.parse(qtyCtrl.text),
                  ratePerKg: double.parse(rateCtrl.text),
                  soldQuantityKg: 0,
                  commissionPerKg: 20,
                  createdAt: Timestamp.now(),
                );

                await TransactionRepository().addItem(widget.txnId, item);

                oilCtrl.clear();
                qtyCtrl.clear();
                rateCtrl.clear();
              },
            ),

            ElevatedButton(
              child: const Text("Add Payment"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddPaymentScreen(txnId: widget.txnId),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
