import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.whoChat,
    required this.message,
    required this.time,
  });

  final String whoChat;
  final String message;
  final String time;

  String format(String timestamp) {
    try {
      // Parsing the unified timestamp format we created earlier: "YYYY-MM-DD HH:mm"
      DateTime date = DateTime.parse(timestamp);
      DateTime now = DateTime.now();
      Duration difference = now.difference(date);

      // Handle relative "Time Ago" for recent messages (Active Chats)
      if (difference.inMinutes < 60) {
        return "${difference.inMinutes} min ago";
      } else if (difference.inHours < 24) {
        return "${difference.inHours} hours ago";
      }

      // Handle absolute date for older messages (Ended Chats)
      // Desired output: "Feb 08 -2024"
      return DateFormat('MMM dd -yyyy').format(date);
    } catch (e) {
      // Return the raw string if parsing fails
      return timestamp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.caribbeanGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageViewer(
                  imagePath: 'assets/images/icons/help.png',
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      whoChat,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // 2. Text now knows its boundaries and will use ellipsis
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreenColor,
                      ),
                      maxLines: 1, // Limits to one line
                      overflow: TextOverflow.ellipsis, // Adds the "..."
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                format(time),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGreenColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
