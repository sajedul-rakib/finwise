import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.id,
    required super.title,
    required super.amount,
    required super.categoryId,
    required super.type,
    required super.createdAt,
    required super.updatedAt,
    super.icon,
  });

  /// [Sr. Dev Note]: Bridge from Domain to Data Layer.
  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      title: entity.title,
      amount: entity.amount,
      categoryId: entity.categoryId,
      type: entity.type,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      icon: entity.icon,
    );
  }

  // --- LOCAL DB MAPPING (SQLite) ---
  Map<String, dynamic> toLocalMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'categoryId': categoryId,
      'type': type.name,
      'icon': icon,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TransactionModel.fromLocalMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      amount: (map['amount'] as num).toDouble(),
      categoryId: map['categoryId'] ?? '',
      icon: map['icon'],
      type: TransactionType.values.byName(map['type']),
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  // --- REMOTE DB MAPPING (Firestore) ---
  Map<String, dynamic> toRemoteMap() {
    return {
      'title': title,
      'amount': amount,
      'categoryId': categoryId,
      'icon': icon,
      'type': type.name,
      'createdAt': createdAt, // Firebase handles DateTime conversion
      'updatedAt': updatedAt,
    };
  }

  factory TransactionModel.fromRemoteMap(
    Map<String, dynamic> map,
    String docId,
  ) {
    return TransactionModel(
      id: docId, // Firestore document ID is usually the model ID
      title: map['title'] ?? '',
      amount: (map['amount'] as num).toDouble(),
      categoryId: map['categoryId'] ?? '',
      type: TransactionType.values.byName(map['type'] ?? 'expense'),
      // Firestore returns timestamps as 'Timestamp' objects
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }
}
