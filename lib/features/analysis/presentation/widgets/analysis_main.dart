import 'package:finwise/features/analysis/presentation/widgets/state_item.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../search/presentation/view/search_by_calender.dart';
import '../../../search/presentation/view/search_by_keyword.dart';
import 'analysis_card.dart';
import 'chart_data.dart';
import 'custom_analysis_icon_btn.dart';

class AnalysisMain extends StatelessWidget {
  const AnalysisMain({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.honeydewGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                padding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.caribbeanGreen,
                ),
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Daily'),
                  Tab(text: 'Weekly'),
                  Tab(text: 'Monthly'),
                  Tab(text: 'Yearly'),
                ],
                labelColor: AppColors.cyprusGreen,
                unselectedLabelColor: AppColors.textGreenColor,
              ),
            ),

            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(30),
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Income & Expense",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textGreenColor,
                        ),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          CAIconButton(
                            icon: Icons.search,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchByKeyword(),
                                ),
                              );
                            },
                          ),
                          CAIconButton(
                            icon: Icons.calendar_month,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchByCalender(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: BarChartSample2()),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StateItem(
                  label: "Income",
                  amount: "\$4,120.00",
                  iconPath: 'assets/images/icons/up_arrow.png',
                  color: AppColors.caribbeanGreen,
                ),
                StateItem(
                  label: "Expense",
                  amount: "\$4,120.00",
                  iconPath: 'assets/images/icons/down-arrow.png',
                  color: AppColors.oceanBlue,
                ),
              ],
            ),

            const SizedBox(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Targets",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textGreenColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TargetCard(
                  targetName: 'Travel',
                  targetAmount: 30 / 100,
                  targetProgress: '30%',
                ),
                TargetCard(
                  targetName: 'Car',
                  targetAmount: 50 / 100,
                  targetProgress: '50%',
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
