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
