import 'package:finwise/features/analysis/presentation/widgets/analysis_main.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/home_header.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            HomeHeader(),
            const SizedBox(height: 20),
            Expanded(child: AnalysisMain(tabController: _tabController)),
          ],
        ),
      ),
    );
  }
}
