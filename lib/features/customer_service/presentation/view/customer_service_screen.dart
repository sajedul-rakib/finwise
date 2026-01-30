import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_btn.dart';

import 'package:flutter/material.dart';

import '../widgets/chat_card.dart';
import 'conversation_screen.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online Support')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 40, right: 30, left: 30),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Active Chats",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGreenColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ChatCard(
                    whoChat: 'Support Assistant',
                    message: "Hello! I'm here to assist you",
                    time: '2026-01-29 14:14:38',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Ended Chats",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGreenColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ChatCard(
                    whoChat: 'Help Center',
                    message: 'Your account ready to use',
                    time: '2026-01-29 10:14:38',
                  ),
                  const SizedBox(height: 10),
                  ChatCard(
                    whoChat: 'Support Assistant',
                    message: 'Hello! I\'m here to assist you',
                    time: '2026-01-14 14:14:38',
                  ),
                  const SizedBox(height: 10),
                  ChatCard(
                    whoChat: 'Support Assistant',
                    message: 'Hello! I\'m here to assist you',
                    time: '2026-01-09 14:14:38',
                  ),
                  const SizedBox(height: 10),
                  ChatCard(
                    whoChat: 'Help Center',
                    message: 'Your account ready to use',
                    time: '2026-01-09 14:14:38',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Center(
              child: SafeArea(
                child: AppButton(
                  title: "Start Another Chat",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversationScreen(),
                      ),
                    );
                  },
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGreenColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
