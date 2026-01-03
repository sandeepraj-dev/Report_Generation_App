import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction_item_model.dart';
import '../models/payment_model.dart';

class TransactionRepository {
  final _db = FirebaseFirestore.instance;

  Future<String> createTransaction() async {
    final doc = await _db.collection('transactions').add({
      'totalBillAmount': 0,
      'totalPaidAmount': 0,
      'totalPendingAmount': 0,
      'status': 'OPEN',
      'createdAt': Timestamp.now(),
    });
    return doc.id;
  }

  Future<void> addItem(String txnId, TransactionItem item) async {
    await _db
        .collection('transactions')
        .doc(txnId)
        .collection('items')
        .add(item.toMap());

    await _recalculate(txnId);
  }

  Future<void> addPayment(String txnId, PaymentModel payment) async {
    await _db
        .collection('transactions')
        .doc(txnId)
        .collection('payments')
        .add(payment.toMap());

    await _recalculate(txnId);
  }

  Future<void> _recalculate(String txnId) async {
    final items = await _db
        .collection('transactions')
        .doc(txnId)
        .collection('items')
        .get();

    final payments = await _db
        .collection('transactions')
        .doc(txnId)
        .collection('payments')
        .get();

    double totalBill = 0;
    double totalPaid = 0;

    for (var doc in items.docs) {
      totalBill += doc['itemTotal'];
    }

    for (var doc in payments.docs) {
      totalPaid += doc['amount'];
    }

    await _db.collection('transactions').doc(txnId).update({
      'totalBillAmount': totalBill,
      'totalPaidAmount': totalPaid,
      'totalPendingAmount': totalBill - totalPaid,
      'status': totalBill == totalPaid ? 'SETTLED' : 'OPEN',
    });
  }
}
