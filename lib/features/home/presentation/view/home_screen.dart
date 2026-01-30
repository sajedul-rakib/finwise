import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_header.dart';
import '../widgets/home_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            HomeHeader(),
            const SizedBox(height: 20),
            Expanded(child: HomeMain(tabController: _tabController)),
          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../core/constant/app_colors.dart';
// import '../../../../core/widgets/image_viewer.dart';
// import '../../../transactions/presentation/widgets/transaction_card.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     _tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.honeydewGreen,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: AppColors.caribbeanGreen,
//             elevation: 0,
//             pinned: true,
//             title: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Hi, Welcome Back",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.fenceGreen,
//                   ),
//                 ),
//                 Text(
//                   "Good Morning",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.normal,
//                     fontFamily: GoogleFonts.leagueSpartan().fontFamily,
//                     color: AppColors.fenceGreen,
//                   ),
//                 ),
//               ],
//             ),
//             actions: [
//               Container(
//                 margin: EdgeInsets.only(right: 20),
//                 padding: EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppColors.lightGreen,
//                 ),
//                 child: Icon(
//                   Icons.notifications_none,
//                   size: 18,
//                   color: AppColors.cyprusGreen,
//                 ),
//               ),
//             ],
//           ),
//           SliverAppBar(
//             backgroundColor: AppColors.caribbeanGreen,
//             elevation: 0,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       spacing: 5,
//                       children: [
//                         Row(
//                           spacing: 5,
//                           children: [
//                             Container(
//                               width: 12,
//                               height: 12,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 border: Border.all(
//                                   color: AppColors.cyprusGreen,
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Icon(
//                                 Icons.arrow_upward,
//                                 size: 10,
//                                 color: AppColors.cyprusGreen,
//                               ),
//                             ),
//                             Text(
//                               "Total Balance",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.normal,
//                                 color: AppColors.textGreenColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           '\$7,783.00',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.honeydewGreen,
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     ImageViewer(imagePath: 'assets/images/icons/line.png'),
//
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       spacing: 5,
//                       children: [
//                         Row(
//                           spacing: 5,
//                           children: [
//                             Container(
//                               width: 12,
//                               height: 12,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 border: Border.all(
//                                   color: AppColors.cyprusGreen,
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: Icon(
//                                 Icons.arrow_downward,
//                                 size: 10,
//                                 color: AppColors.cyprusGreen,
//                               ),
//                             ),
//                             Text(
//                               "Total Expense",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.normal,
//                                 color: AppColors.textGreenColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           '-\$7,783.00',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.oceanBlue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SliverAppBar(
//             backgroundColor: AppColors.caribbeanGreen,
//             elevation: 0,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     LinearProgressIndicator(
//                       value: 0.3,
//                       backgroundColor: AppColors.cyprusGreen,
//                       valueColor: AlwaysStoppedAnimation<Color>(
//                         AppColors.honeydewGreen,
//                       ),
//                       minHeight: 20,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       spacing: 5,
//                       children: [
//                         Container(
//                           width: 15,
//                           height: 15,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             border: Border.all(
//                               color: AppColors.cyprusGreen,
//                               width: 1,
//                             ),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Icon(
//                             Icons.check,
//                             size: 12,
//                             color: AppColors.cyprusGreen,
//                           ),
//                         ),
//                         Text(
//                           '30% of your expenses, looks good.',
//
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal,
//                             color: AppColors.cyprusGreen,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SliverAppBar(
//             backgroundColor: AppColors.caribbeanGreen,
//             elevation: 0,
//             expandedHeight: 240,
//             flexibleSpace: FlexibleSpaceBar(
//               background: SafeArea(
//                 child: Container(
//                   clipBehavior: Clip.hardEdge,
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: AppColors.honeydewGreen,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50),
//                       topRight: Radius.circular(50),
//                     ),
//                   ),
//                   child: Container(
//                     margin: EdgeInsets.only(top: 60, bottom: 20),
//                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//                     decoration: BoxDecoration(
//                       color: AppColors.caribbeanGreen,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.max,
//                       spacing: 10,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           spacing: 10,
//                           children: [
//                             Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 SizedBox(
//                                   width: 70,
//                                   height: 70,
//                                   child: CircularProgressIndicator(
//                                     value: 0.6,
//                                     strokeCap: StrokeCap.round,
//                                     backgroundColor: AppColors.honeydewGreen,
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       AppColors.oceanBlue,
//                                     ),
//                                     strokeWidth: 5,
//                                   ),
//                                 ),
//                                 ImageViewer(
//                                   imagePath: 'assets/images/icons/car.png',
//                                   width: 40,
//                                   height: 40,
//                                   fit: BoxFit.contain,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 65,
//                               height: 40,
//                               child: Text(
//                                 "Savings on goals",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: AppColors.cyprusGreen,
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 2,
//                               ),
//                             ),
//                           ],
//                         ),
//                         ImageViewer(
//                           imagePath: 'assets/images/icons/line.png',
//                           height: 100,
//                           fit: BoxFit.fitHeight,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           mainAxisSize: MainAxisSize.min,
//                           spacing: 10,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisSize: MainAxisSize.max,
//                               spacing: 10,
//                               children: [
//                                 ImageViewer(
//                                   imagePath: 'assets/images/icons/money.png',
//                                   width: 30,
//                                   height: 30,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                                   children: [
//                                     Text(
//                                       'Revenue Last Week',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.normal,
//                                         color: AppColors.fenceGreen,
//                                       ),
//                                     ),
//                                     Text(
//                                       '\$4.000.00',
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily:
//                                             GoogleFonts.inter().fontFamily,
//                                         color: AppColors.fenceGreen,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             ImageViewer(
//                               imagePath:
//                                   'assets/images/icons/vertical_line.png',
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisSize: MainAxisSize.max,
//                               spacing: 10,
//                               children: [
//                                 ImageViewer(
//                                   imagePath: 'assets/images/icons/spoon.png',
//                                   width: 30,
//                                   height: 30,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                                   children: [
//                                     Text(
//                                       'Food Last Week',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.normal,
//                                         color: AppColors.fenceGreen,
//                                       ),
//                                     ),
//                                     Text(
//                                       '-\$4.000.00',
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily:
//                                             GoogleFonts.inter().fontFamily,
//                                         color: AppColors.oceanBlue,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverAppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             pinned: true,
//             toolbarHeight: 30,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Container(
//                 padding: EdgeInsets.only(left: 20, right: 20, top: 10),
//                 width: double.infinity,
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: AppColors.lightGreen,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: TabBar(
//                     padding: EdgeInsets.zero,
//                     dividerColor: Colors.transparent,
//                     dividerHeight: 0,
//                     labelStyle: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.normal,
//                       color: AppColors.cyprusGreen,
//                     ),
//                     indicatorColor: AppColors.cyprusGreen,
//                     indicatorWeight: 3,
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicator: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: AppColors.caribbeanGreen,
//                     ),
//                     controller: _tabController,
//                     tabs: [
//                       Tab(child: Text('Daily')),
//                       Tab(child: Text('Weekly')),
//                       Tab(child: Text('Monthly')),
//                     ],
//                     labelColor: AppColors.cyprusGreen,
//                     unselectedLabelColor: AppColors.textGreenColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate((context, index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: TransactionCard(),
//               );
//             }, childCount: 60),
//           ),
//         ],
//       ),
//     );
//   }
// }
