import 'dart:convert';

import 'package:equatable/equatable.dart';

class FinwiseTransaction extends Equatable {
  const FinwiseTransaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.category,
    required this.tags,
    required this.isRecurring,
    required this.createdAt,
  });

  final String id;
  final double amount;
  final String description;
  final FinwiseTransactionCategory category;
  final List<String> tags;
  final bool isRecurring;
  final DateTime createdAt;

  FinwiseTransaction copyWith({
    String? id,
    double? amount,
    String? description,
    FinwiseTransactionCategory? category,
    List<String>? tags,
    bool? isRecurring,
    DateTime? createdAt,
  }) {
    return FinwiseTransaction(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      isRecurring: isRecurring ?? this.isRecurring,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'category': category.toMap(),
      'tags': tags,
      'is_recurring': isRecurring,
      'created_at': createdAt.toUtc().toIso8601String(),
    };
  }

  factory FinwiseTransaction.fromMap(Map<String, dynamic> map) {
    return FinwiseTransaction(
      id: map['id'] as String,
      amount: (map['amount'] as num).toDouble(),
      description: map['description'] as String,
      category: FinwiseTransactionCategory.fromMap(
        Map<String, dynamic>.from(map['category'] as Map),
      ),
      tags: (map['tags'] as List).cast<String>(),
      isRecurring: map['is_recurring'] as bool,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory FinwiseTransaction.fromJson(String source) =>
      FinwiseTransaction.fromMap(jsonDecode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [
        id,
        amount,
        description,
        category,
        tags,
        isRecurring,
        createdAt,
      ];
}

class FinwiseTransactionCategory extends Equatable {
  const FinwiseTransactionCategory({
    required this.id,
    required this.name,
    required this.icon,
  });

  final int id;
  final String name;
  final String icon;

  FinwiseTransactionCategory copyWith({
    int? id,
    String? name,
    String? icon,
  }) {
    return FinwiseTransactionCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
    };
  }

  factory FinwiseTransactionCategory.fromMap(Map<String, dynamic> map) {
    return FinwiseTransactionCategory(
      id: (map['id'] as num).toInt(),
      name: map['name'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory FinwiseTransactionCategory.fromJson(String source) =>
      FinwiseTransactionCategory.fromMap(
        jsonDecode(source) as Map<String, dynamic>,
      );

  @override
  List<Object?> get props => [id, name, icon];
}

