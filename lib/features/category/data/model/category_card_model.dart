class CategoryCardModel {
  final String id;
  final String title;
  final String icon;
  final double totalBalance;
  final double totalExpense;
  final Savings savings;
  final List<TransactionItems> transactionItems;

  CategoryCardModel({
    required this.id,
    required this.title,
    required this.icon,
    this.totalBalance = 0.0,
    this.totalExpense = 0.0,
    required this.savings,
    required this.transactionItems,
  });

  factory CategoryCardModel.fromJson(Map<String, dynamic> json) {
    return CategoryCardModel(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
      totalBalance: (json['totalEarnings'] as num? ?? 0.0).toDouble(),
      totalExpense: (json['expenses'] as num? ?? 0.0).toDouble(),
      savings: json['savings'] != null
          ? Savings.fromJson(json['savings'] as Map<String, dynamic>)
          : Savings(goal: 0.0, savings: 0.0),
      transactionItems:
          (json['transaction_items'] as List?)
              ?.map((v) => TransactionItems.fromJson(v as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class Savings {
  final double goal;
  final double savings;

  Savings({required this.goal, required this.savings});

  factory Savings.fromJson(Map<String, dynamic> json) {
    return Savings(
      goal: (json['goal'] as num).toDouble(),
      savings: (json['savings'] as num).toDouble(),
    );
  }

  // Goal fulfillment calculation
  double get progress => goal > 0 ? (savings / goal).clamp(0.0, 1.0) : 0.0;
  int get percent => (progress * 100).toInt();
}

class TransactionItems {
  final String id;
  final String title;
  final String timestamp; // Updated from createAt

  final double amount;

  TransactionItems({
    required this.id,
    required this.title,
    required this.timestamp,
    required this.amount,
  });

  factory TransactionItems.fromJson(Map<String, dynamic> json) {
    return TransactionItems(
      id: json['id'] as String,
      title: json['title'] as String,
      timestamp: json['timestamp'] as String,
      amount: (json['amount'] as num).toDouble(),
    );
  }
}
