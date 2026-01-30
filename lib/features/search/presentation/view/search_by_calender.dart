import 'package:finwise/features/transactions/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../widgets/search_btn.dart';

class SearchByCalender extends StatefulWidget {
  const SearchByCalender({super.key});

  @override
  State<SearchByCalender> createState() => _SearchByCalenderState();
}

class _SearchByCalenderState extends State<SearchByCalender> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calender")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                    const SizedBox(height: 20),
                    Theme(
                      data: Theme.of(context).copyWith(
                        datePickerTheme: DatePickerThemeData(
                          headerForegroundColor: AppColors.caribbeanGreen,
                          headerBackgroundColor: AppColors.caribbeanGreen,
                          yearBackgroundColor: WidgetStatePropertyAll(
                            AppColors.caribbeanGreen,
                          ),
                          weekdayStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.oceanBlue,
                          ),
                          yearStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.caribbeanGreen,
                          ),
                          backgroundColor: AppColors.caribbeanGreen,
                          dayStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          rangePickerBackgroundColor: AppColors.caribbeanGreen,
                          rangePickerHeaderBackgroundColor:
                              AppColors.caribbeanGreen,
                        ),
                        colorScheme: ColorScheme.light(
                          primary: AppColors.caribbeanGreen,
                          onPrimary: AppColors.textGreenColor,
                          onSurface: AppColors.textGreenColor,
                          surface: AppColors.caribbeanGreen,
                        ),
                      ),
                      child: CalendarDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050),
                        onDateChanged: (value) {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchBtn(title: 'Spends', onPressed: () {}),
                        SearchBtn(
                          title: 'Categories',
                          onPressed: () {},
                          applyTextColor: true,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
