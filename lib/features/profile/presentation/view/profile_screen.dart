import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/features/profile/data/datasource/screen_items_data.dart';
import 'package:finwise/features/profile/data/models/screen_item_model.dart';
import 'package:flutter/material.dart';

import '../widgets/item_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Column(
        children: [
          const SizedBox(height: 80),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: AppColors.honeydewGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Expanded(
                        child: ListView.builder(
                          itemCount: ScreenItemsData.screenItemsData.length,
                          itemBuilder: (context, index) {
                            final item = ScreenItemsData.screenItemsData[index];
                            ScreenItemModel screenItemModel =
                                ScreenItemModel.fromJson(item);
                            return ItemCard(screenItemModel: screenItemModel);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -60,
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.honeydewGreen,
                          image: DecorationImage(
                            onError: (obj, stacktrace) {},
                            fit: BoxFit.cover,
                            image: const NetworkImage(
                              "https://plus.unsplash.com/premium_photo-1689977807477-a579eda91fa2?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "John Smith",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreenColor,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "ID: ",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGreenColor,
                          ),
                          children: [
                            TextSpan(
                              text: "123456",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w200,
                                color: AppColors.textGreenColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
