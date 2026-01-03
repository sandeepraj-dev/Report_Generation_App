import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionItem {
  final String id;
  final String oilType;
  final int quantityKg;
  final int soldQuantityKg;
  final double ratePerKg;
  final double commissionPerKg;
  final Timestamp createdAt;

  TransactionItem({
    required this.id,
    required this.oilType,
    required this.quantityKg,
    required this.ratePerKg,
    this.soldQuantityKg = 0,
    this.commissionPerKg = 20,
    required this.createdAt,
  });

  /// Total oil value
  double get itemTotal => quantityKg * ratePerKg;

  /// Total commission you earn
  double get totalCommission => quantityKg * commissionPerKg;

  /// Remaining stock
  int get remainingQuantityKg => quantityKg - soldQuantityKg;

  /// Convert to Firestore Map
  Map<String, dynamic> toMap() {
    return {
      'oilType': oilType,
      'quantityKg': quantityKg,
      'soldQuantityKg': soldQuantityKg,
      'ratePerKg': ratePerKg,
      'commissionPerKg': commissionPerKg,
      'itemTotal': itemTotal,
      'totalCommission': totalCommission,
      'createdAt': createdAt,
    };
  }

  /// Create from Firestore
  factory TransactionItem.fromMap(String id, Map<String, dynamic> map) {
    return TransactionItem(
      id: id,
      oilType: map['oilType'],
      quantityKg: map['quantityKg'],
      soldQuantityKg: map['soldQuantityKg'] ?? 0,
      ratePerKg: (map['ratePerKg'] as num).toDouble(),
      commissionPerKg: (map['commissionPerKg'] as num?)?.toDouble() ?? 20,
      createdAt: map['createdAt'],
    );
  }

  /// For updating partial sell
  TransactionItem copyWith({int? soldQuantityKg, double? ratePerKg}) {
    return TransactionItem(
      id: id,
      oilType: oilType,
      quantityKg: quantityKg,
      soldQuantityKg: soldQuantityKg ?? this.soldQuantityKg,
      ratePerKg: ratePerKg ?? this.ratePerKg,
      commissionPerKg: commissionPerKg,
      createdAt: createdAt,
    );
  }
}
