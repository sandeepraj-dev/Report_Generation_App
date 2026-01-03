import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDetailScreen extends StatelessWidget {
  final String txnId;
  const TransactionDetailScreen({super.key, required this.txnId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction Details")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('transactions')
            .doc(txnId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          final data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total Bill: ₹${data['totalBillAmount']}"),
                Text("Paid: ₹${data['totalPaidAmount']}"),
                Text("Pending: ₹${data['totalPendingAmount']}"),
                Text("Status: ${data['status']}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
