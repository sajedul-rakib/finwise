import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_switch_btn.dart';
import 'package:flutter/material.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification Settings")),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          spacing: 10,
          children: [
            AppSwitchBtn(
              value: true,
              onChanged: (val) {},
              title: 'General Notification',
            ),
            AppSwitchBtn(value: true, onChanged: (val) {}, title: 'Sound'),
            AppSwitchBtn(value: true, onChanged: (val) {}, title: 'Sound Call'),
            AppSwitchBtn(value: true, onChanged: (val) {}, title: 'Vibrate'),
            AppSwitchBtn(
              value: false,
              onChanged: (val) {},
              title: 'Transaction Update',
            ),
            AppSwitchBtn(
              value: false,
              onChanged: (val) {},
              title: 'Expense Reminder',
            ),
            AppSwitchBtn(
              value: false,
              onChanged: (val) {},
              title: 'Budgets Notifications',
            ),
            AppSwitchBtn(
              value: false,
              onChanged: (val) {},
              title: 'Low Balance Alerts',
            ),
          ],
        ),
      ),
    );
  }
}
