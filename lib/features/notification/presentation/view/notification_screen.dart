import 'package:finwise/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/date_title.dart';
import '../widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              DateTitle(title: "Today"),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              DateTitle(title: "Yesterday"),
              NotificationCard(),
              NotificationCard(),
              DateTitle(title: "This Weekend"),
              NotificationCard(),
              NotificationCard(),
            ],
          ),
        ),
      ),
    );
  }
}
