import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/features/help/data/datasource/faq_question_data.dart';
import 'package:finwise/features/help/data/model/social_link_model.dart';
import 'package:flutter/material.dart';

import '../../data/model/faq_question_model.dart';
import '../widgets/faq_question.dart';
import '../widgets/social_link_card.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _sortTabController;

  String _currentPage = 'FAQ';

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _sortTabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help & FAQS")),
      body: Container(
        padding: EdgeInsets.only(top: 20, right: 30, left: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Text(
              "How Can We Help You?",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textGreenColor,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                onTap: (int index) {
                  index == 0
                      ? setState(() {
                          _currentPage = 'FAQ';
                        })
                      : setState(() {
                          _currentPage = 'Contact Us';
                        });
                },
                padding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColors.cyprusGreen,
                ),
                indicatorColor: AppColors.cyprusGreen,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.caribbeanGreen,
                ),
                controller: _tabController,
                tabs: [
                  Tab(child: Text('FAQ')),
                  Tab(child: Text('Contact Us')),
                ],
                labelColor: AppColors.cyprusGreen,
                unselectedLabelColor: AppColors.textGreenColor,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColors.cyprusGreen,
                ),
                indicatorColor: AppColors.cyprusGreen,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.caribbeanGreen,
                ),
                controller: _sortTabController,
                tabs: [
                  Tab(child: Text('General')),
                  Tab(child: Text('Account')),
                  Tab(child: Text('Service')),
                ],
                labelColor: AppColors.cyprusGreen,
                unselectedLabelColor: AppColors.textGreenColor,
              ),
            ),
            const SizedBox(height: 10),
            FormInput(
              hintText: "Search",
              hintColor: AppColors.textGreenColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.caribbeanGreen,
                  width: 2,
                ),
              ),
            ),

            const SizedBox(height: 30),
            if (_currentPage == 'FAQ')
              Expanded(
                child: ListView.builder(
                  itemCount: FaqQuestionData.faqList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final faq = FaqQuestionData.faqList[index];
                    final faqModel = FaqModel.fromJson(faq);
                    return FaqQuestion(faqModel: faqModel);
                  },
                ),
              ),
            if (_currentPage == 'Contact Us')
              Expanded(
                child: ListView.builder(
                  itemCount: FaqQuestionData.socialLinks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final socialLink = FaqQuestionData.socialLinks[index];
                    final socialLinkModel = SocialLinkModel.fromJson(
                      socialLink,
                    );
                    return SocialLinkCard(socialLinkModel: socialLinkModel);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
