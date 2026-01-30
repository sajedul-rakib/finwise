import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_btn.dart';
import 'package:flutter/material.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  bool _acceptTermsAndCondition = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms And Conditions"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Est Fugiat Assumenda Aut Reprehenderit",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet. Et odio officia aut voluptate internos est omnis vitae ut architecto sunt non tenetur fuga ut provident vero. Quo aspernatur facere et consectetur ipsum et facere corrupti est asperiores facere. Est fugiat assumenda aut reprehenderit voluptatem sed.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    _buildNumberedList([
                      'Ea voluptates omnis aut sequi sequi.',
                      'Est dolore quae in aliquid ducimus et autem repellendus.',
                      'Aut ipsum Quis qui porro quasi aut minus placeat!',
                      'Sit consequatur neque ab vitae facere.',
                    ]),
                    const SizedBox(height: 10),
                    Text(
                      "Aut quidem accusantium nam alias autem eum officiis placeat et omnis autem id officiis perspiciatis qui corrupti officia eum aliquam provident. Eum voluptas error et optio dolorum cum molestiae nobis et odit molestiae quo magnam impedit sed fugiat nihil non nihil vitae.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    _buildBulletPoint(
                      'Aut fuga sequi eum voluptatibus provident.',
                    ),
                    const SizedBox(height: 5),
                    _buildBulletPoint(
                      'Eos consequuntur voluptas vel amet eaque aut dignissimos velit.',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Vel exercitationem quam vel eligendi rerum At harum obcaecati et nostrum beatae? Ea accusantium dolores qui rerum aliquam est perferendis mollitia et ipsum ipsa qui enim autem At corporis sunt. Aut odit quisquam est reprehenderit itaque aut accusantium dolor qui neque repellat.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Read the terms and conditions in more detail at",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Text(
                      "www.finwiseapp.de",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.oceanBlue,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.oceanBlue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 10,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _acceptTermsAndCondition =
                                  !_acceptTermsAndCondition;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.fenceGreen,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Visibility(
                              visible: _acceptTermsAndCondition,
                              child: Icon(
                                Icons.check,
                                color: AppColors.fenceGreen,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "I accept all the terms and conditions",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: AppButton(title: "Accept", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberedList(List<String> items) {
    return Column(
      children: items.asMap().entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${entry.key + 1}. ",
                style: TextStyle(color: AppColors.blackColor),
              ),
              Expanded(
                child: Text(
                  entry.value,
                  style: TextStyle(color: AppColors.blackColor),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(text, style: TextStyle(color: AppColors.blackColor)),
          ),
        ],
      ),
    );
  }
}
