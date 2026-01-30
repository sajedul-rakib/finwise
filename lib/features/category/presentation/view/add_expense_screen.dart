import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_btn.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 40, left: 50, right: 50),
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 40,
                  children: [
                    FormInput(
                      labelText: "Date",
                      hintText: 'Select the date',
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.caribbeanGreen,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Icon(
                          CupertinoIcons.calendar,
                          size: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreenColor,
                        ),
                      ),
                    ),
                    FormInput(
                      labelText: "Categories",
                      hintText: 'Select the category',
                      suffixIcon: Icon(
                        CupertinoIcons.chevron_down,
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.caribbeanGreen,
                      ),
                    ),

                    FormInput(
                      labelText: "Amount",
                      hintText: 'Select the category',
                    ),

                    FormInput(
                      labelText: "Expense Title",

                      hintText: 'Enter title',
                    ),

                    FormInput(
                      hintText: 'Enter Message',
                      hintColor: AppColors.caribbeanGreen,
                      maxLines: 4,
                    ),

                    AppButton(title: 'Save', onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
