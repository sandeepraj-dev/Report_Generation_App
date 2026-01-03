import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  final double amount;
  final String mode;
  final Timestamp createdAt;

  PaymentModel({
    required this.amount,
    required this.mode,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
    'amount': amount,
    'mode': mode,
    'createdAt': createdAt,
  };
}
