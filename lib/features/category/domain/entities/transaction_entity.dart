import 'package:equatable/equatable.dart';

enum TransactionType { expense, savings }

class TransactionEntity extends Equatable {
  final String id;
  final String title;
  final double amount;
  final String categoryId;
  final String? icon;
  final TransactionType type;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TransactionEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.categoryId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.icon,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    amount,
    categoryId,
    type,
    createdAt,
    updatedAt,
  ];
}
