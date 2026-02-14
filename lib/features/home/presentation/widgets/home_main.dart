import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../../../transactions/presentation/widgets/transaction_card.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key, required TabController tabController})
    : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.honeydewGreen,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.caribbeanGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    spacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        spacing: 10,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: CircularProgressIndicator(
                                  value: 0.6,
                                  strokeCap: StrokeCap.round,
                                  backgroundColor: AppColors.honeydewGreen,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.oceanBlue,
                                  ),
                                  strokeWidth: 5,
                                ),
                              ),
                              ImageViewer(
                                imagePath: 'assets/images/icons/car.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 65,
                            height: 40,
                            child: Text(
                              "Savings on goals",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.cyprusGreen,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      ImageViewer(
                        imagePath: 'assets/images/icons/line.png',
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            spacing: 10,
                            children: [
                              ImageViewer(
                                imagePath: 'assets/images/icons/money.png',
                                width: 30,
                                height: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Revenue Last Week',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.fenceGreen,
                                    ),
                                  ),
                                  Text(
                                    '\$4.000.00',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      color: AppColors.fenceGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ImageViewer(
                            imagePath: 'assets/images/icons/vertical_line.png',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            spacing: 10,
                            children: [
                              ImageViewer(
                                imagePath: 'assets/images/icons/spoon.png',
                                width: 30,
                                height: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Food Last Week',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.fenceGreen,
                                    ),
                                  ),
                                  Text(
                                    '-\$4.000.00',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                      color: AppColors.oceanBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: AppColors.honeydewGreen,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    dividerHeight: 0,
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    indicatorColor: AppColors.cyprusGreen,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.caribbeanGreen,
                    ),
                    controller: _tabController,
                    tabs: const [
                      Tab(child: Text('Daily')),
                      Tab(child: Text('Weekly')),
                      Tab(child: Text('Monthly')),
                    ],
                    labelColor: AppColors.cyprusGreen,
                    unselectedLabelColor: AppColors.textGreenColor,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return const TransactionCard();
              }, childCount: 10),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 84.0;
  @override
  double get maxExtent => 84.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
