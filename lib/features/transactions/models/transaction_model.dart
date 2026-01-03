class TransactionModel {
  final String id;
  final double totalBill;
  final double totalPaid;
  final double totalPending;
  final String status;

  TransactionModel({
    required this.id,
    required this.totalBill,
    required this.totalPaid,
    required this.totalPending,
    required this.status,
  });

  Map<String, dynamic> toMap() => {
    'totalBillAmount': totalBill,
    'totalPaidAmount': totalPaid,
    'totalPendingAmount': totalPending,
    'status': status,
    'createdAt': DateTime.now(),
  };
}
