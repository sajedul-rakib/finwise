import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  bool isMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Online Support')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
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
                  Tab(
                    child: Text(
                      'Support Assistant',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.cyprusGreen,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Help Center',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.cyprusGreen,
                      ),
                    ),
                  ),
                ],
                labelColor: AppColors.cyprusGreen,
                unselectedLabelColor: AppColors.textGreenColor,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 10,
                          children: [
                            ConversationCard(
                              isMe: !isMe,
                              message: 'Welcome, I am your virtual assistant.',
                            ),
                            ConversationCard(
                              isMe: !isMe,
                              message: "How can I help you today?",
                            ),
                            ConversationCard(
                              isMe: isMe,
                              message:
                                  "Hello! I have a question. How can I record my expenses by date?",
                            ),
                            ConversationCard(
                              isMe: !isMe,
                              message:
                                  "Response to your request:  You can register expenses in the top menu of the homepage. ",
                            ),
                            ConversationCard(
                              isMe: !isMe,
                              message:
                                  "Enter the purchase information, including the date, etc.",
                            ),
                            ConversationCard(
                              isMe: isMe,
                              message: 'OK, thanks a lot.',
                            ),
                            ConversationCard(
                              isMe: !isMe,
                              message:
                                  ' It was a pleasure to accommodate your request. See you soon!',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.caribbeanGreen,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ImageViewer(
                                imagePath: 'assets/images/icons/help.png',
                                color: AppColors.textGreenColor,
                              ),
                            ),
                            Expanded(
                              child: FormInput(
                                hintText: "Write Here ...",
                                fillColor: AppColors.whiteColor,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ImageViewer(
                                imagePath: 'assets/images/icons/voice.png',
                                color: AppColors.textGreenColor,
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ImageViewer(
                                imagePath: 'assets/images/icons/send.png',
                                color: AppColors.textGreenColor,
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    super.key,
    required this.isMe,
    required this.message,
  });

  final bool isMe;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      // Aligns the bubble to the right if isMe is true, otherwise left
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        // No fixed width or MediaQuery used here
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: isMe ? AppColors.caribbeanGreen : AppColors.lightGreen,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(
              isMe ? 16 : 0,
            ), // Sharp corner for incoming
            bottomRight: Radius.circular(
              isMe ? 0 : 16,
            ), // Sharp corner for outgoing
          ),
        ),
        // Flexible allows the text to wrap without a hard width
        child: Text(
          message,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textGreenColor,
          ),
        ),
      ),
    );
  }
}
