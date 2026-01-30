import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../data/model/faq_question_model.dart';

class FaqQuestion extends StatefulWidget {
  const FaqQuestion({super.key, required this.faqModel});

  final FaqModel faqModel;

  @override
  State<FaqQuestion> createState() => _FaqQuestionState();
}

class _FaqQuestionState extends State<FaqQuestion> {
  bool _isShownAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isShownAnswer = !_isShownAnswer;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.faqModel.question,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGreenColor,
                    ),
                  ),
                ),

                Transform.rotate(
                  angle: (_isShownAnswer ? 90 : 270) * 3.14 / 180,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: AppColors.textGreenColor,
                    size: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isShownAnswer)
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.faqModel.answer,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textGreenColor,
              ),
            ),
          ),
      ],
    );
  }
}
