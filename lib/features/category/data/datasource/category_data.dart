class CategoryData {
  // Category Section: Each standard category now has 3 transactions and a timestamp
  static const List<Map<String, dynamic>> categories = [
    {
      "id": "food",
      "title": "Food",
      "icon": "assets/images/icons/spoon.png",
      "totalEarnings": 0.0,
      "expenses": 150.0,
      "transaction_items": [
        {
          "id": "f1",
          "title": "Pizza Hut",
          "timestamp": "2026-01-25 19:30",
          "amount": 40.0,
        },
        {
          "id": "f2",
          "title": "Grocery Mart",
          "timestamp": "2026-01-26 10:15",
          "amount": 90.0,
        },
        {
          "id": "f3",
          "title": "Coffee Shop",
          "timestamp": "2026-01-27 08:45",
          "amount": 20.0,
        },
      ],
    },
    {
      "id": "transport",
      "title": "Transport",
      "icon": "assets/images/icons/bus.png",
      "totalEarnings": 0.0,
      "expenses": 50.0,
      "transaction_items": [
        {
          "id": "t1",
          "title": "Bus Fare",
          "timestamp": "2026-01-24 07:30",
          "amount": 10.0,
        },
        {
          "id": "t2",
          "title": "Uber Ride",
          "timestamp": "2026-01-25 22:00",
          "amount": 25.0,
        },
        {
          "id": "t3",
          "title": "Train Ticket",
          "timestamp": "2026-01-27 09:00",
          "amount": 15.0,
        },
      ],
    },
    {
      "id": "medicine",
      "title": "Medicine",
      "icon": "assets/images/icons/medicine.png",
      "totalEarnings": 0.0,
      "expenses": 45.0,
      "transaction_items": [
        {
          "id": "m1",
          "title": "Pharmacy",
          "timestamp": "2026-01-20 11:00",
          "amount": 20.0,
        },
        {
          "id": "m2",
          "title": "Clinic Visit",
          "timestamp": "2026-01-22 14:00",
          "amount": 15.0,
        },
        {
          "id": "m3",
          "title": "Vitamins",
          "timestamp": "2026-01-26 10:00",
          "amount": 10.0,
        },
      ],
    },
    {
      "id": "groceries",
      "title": "Groceries",
      "icon": "assets/images/icons/grocery.png",
      "totalEarnings": 0.0,
      "expenses": 200.0,
      "transaction_items": [
        {
          "id": "g1",
          "title": "Vegetables",
          "timestamp": "2026-01-24 16:00",
          "amount": 50.0,
        },
        {
          "id": "g2",
          "title": "Fruits",
          "timestamp": "2026-01-25 11:00",
          "amount": 50.0,
        },
        {
          "id": "g3",
          "title": "Supermarket",
          "timestamp": "2026-01-27 17:00",
          "amount": 100.0,
        },
      ],
    },
    {
      "id": "rent",
      "title": "Rent",
      "icon": "assets/images/icons/rent.png",
      "totalEarnings": 0.0,
      "expenses": 800.0,
      "transaction_items": [
        {
          "id": "r1",
          "title": "Apartment Rent",
          "timestamp": "2026-01-01 09:00",
          "amount": 700.0,
        },
        {
          "id": "r2",
          "title": "Water Bill",
          "timestamp": "2026-01-05 10:00",
          "amount": 50.0,
        },
        {
          "id": "r3",
          "title": "Electricity",
          "timestamp": "2026-01-10 11:00",
          "amount": 50.0,
        },
      ],
    },
    {
      "id": "gift",
      "title": "Gifts",
      "icon": "assets/images/icons/gift.png",
      "totalEarnings": 100.0,
      "expenses": 0.0,
      "transaction_items": [
        {
          "id": "gi1",
          "title": "Cash Received",
          "timestamp": "2026-01-20 12:00",
          "amount": 50.0,
        },
        {
          "id": "gi2",
          "title": "Birthday Gift",
          "timestamp": "2026-01-22 10:00",
          "amount": 30.0,
        },
        {
          "id": "gi3",
          "title": "Holiday Bonus",
          "timestamp": "2026-01-27 09:00",
          "amount": 20.0,
        },
      ],
    },
    {
      "id": "entertainment",
      "title": "Entertainment",
      "icon": "assets/images/icons/ticket.png",
      "totalEarnings": 0.0,
      "expenses": 60.0,
      "transaction_items": [
        {
          "id": "e1",
          "title": "Movie Night",
          "timestamp": "2026-01-24 21:00",
          "amount": 30.0,
        },
        {
          "id": "e2",
          "title": "Bowling",
          "timestamp": "2026-01-25 18:00",
          "amount": 20.0,
        },
        {
          "id": "e3",
          "title": "Streaming Sub",
          "timestamp": "2026-01-01 00:00",
          "amount": 10.0,
        },
      ],
    },
    {
      "id": "savings",
      "title": "Savings",
      "icon": "assets/images/icons/savings.png",
      "totalEarnings": 0.0,
      "expenses": 0.0,
    },
    {"id": "add", "title": "Add", "icon": "assets/images/icons/add.png"},
  ];

  static const List<Map<String, dynamic>> savings = [
    {
      "id": "travel",
      "title": "Travel",
      "icon": "assets/images/icons/plane.png",
      "savings": {"goal": 1962.93, "savings": 653.31},
      "transaction_items": [
        {
          "id": "asd;kljf",
          "title": 'Transport Deposit',
          "timestamp": "2022-10-10 10:00",
          "amount": 217.66,
        },
        {
          "id": "re;kljf",
          "title": 'Transport Deposit',
          "timestamp": "2022-10-11 11:30",
          "amount": 217.66,
        },
        {
          "id": "asd;df",
          "title": 'Transport Deposit',
          "timestamp": "2022-10-12 09:00",
          "amount": 217.66,
        },
      ],
    },
    {
      "id": "new-house",
      "title": "New House",
      "icon": "assets/images/icons/new_house.png",
      "savings": {"goal": 5000.00, "savings": 1500.31},
      "transaction_items": [
        {
          "id": "asd;ghd",
          "title": 'House Deposit',
          "timestamp": "2022-11-01 14:00",
          "amount": 500.0,
        },
        {
          "id": "adsfg;kljf",
          "title": 'House Deposit',
          "timestamp": "2022-11-15 12:00",
          "amount": 500.0,
        },
        {
          "id": "kjg;kljf",
          "title": 'House Deposit',
          "timestamp": "2022-12-01 10:30",
          "amount": 500.31,
        },
      ],
    },
    {
      "id": "car",
      "title": "Car",
      "icon": "assets/images/icons/car.png",
      "savings": {"goal": 10000.93, "savings": 4000.31},
      "transaction_items": [
        {
          "id": "23;kljf",
          "title": 'Car Deposit',
          "timestamp": "2023-01-10 16:00",
          "amount": 1500.0,
        },
        {
          "id": "4254;kljf",
          "title": 'Car Deposit',
          "timestamp": "2023-02-10 15:00",
          "amount": 1500.0,
        },
        {
          "id": "23;454",
          "title": 'Car Deposit',
          "timestamp": "2023-03-10 11:00",
          "amount": 1000.31,
        },
      ],
    },
    {
      "id": "wedding",
      "title": "Wedding",
      "icon": "assets/images/icons/wedding.png",
      "savings": {"goal": 3000.93, "savings": 120.31},
      "transaction_items": [
        {
          "id": "23;7856",
          "title": 'Wedding Deposit',
          "timestamp": "2023-05-10 09:00",
          "amount": 40.0,
        },
        {
          "id": "23;789",
          "title": 'Wedding Deposit',
          "timestamp": "2023-06-10 10:00",
          "amount": 40.0,
        },
        {
          "id": "23;123",
          "title": 'Wedding Deposit',
          "timestamp": "2023-07-10 14:00",
          "amount": 40.31,
        },
      ],
    },
  ];
}
