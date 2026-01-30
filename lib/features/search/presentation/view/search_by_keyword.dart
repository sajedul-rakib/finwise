import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/features/transactions/presentation/widgets/transaction_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../widgets/radio_btn.dart';

class SearchByKeyword extends StatefulWidget {
  const SearchByKeyword({super.key});

  @override
  State<SearchByKeyword> createState() => _SearchByKeywordState();
}

class _SearchByKeywordState extends State<SearchByKeyword> {
  late TextEditingController _dateEtcController;

  String _selectedValue = 'expense';

  @override
  void initState() {
    _dateEtcController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FormInput(
              hintText: "Search ...",
              hintColor: Color(0xff232323),
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
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
                        const SizedBox(height: 20),
                        FormInput(
                          labelText: "Date",
                          hintText: 'Select the date',
                          controller: _dateEtcController,
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
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Report",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RadioGroup(
                            onChanged: (value) {
                              if (value == _selectedValue) return;
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                            groupValue: _selectedValue,
                            child: Column(
                              children: [
                                RadioBtn(label: 'Expense'),
                                RadioBtn(label: 'Income'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          AppButton(title: 'Search', onPressed: () {}),

                          const SizedBox(height: 20),

                          Expanded(
                            child: Column(
                              children: [TransactionCard(hasBackground: true)],
                            ),
                          ),
                        ],
                      ),
                    ),
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
