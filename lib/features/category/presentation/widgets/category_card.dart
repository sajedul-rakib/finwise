import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../../data/model/category_card_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.clickCategory,
  });

  final CategoryCardModel category;
  final Function(BuildContext) clickCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clickCategory(context),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.vividBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Transform.rotate(
                  angle: category.title.toLowerCase() == 'entertainment'
                      ? -90 * 3.1416 / 360
                      : 0,
                  child: ImageViewer(
                    imagePath: category.icon,
                    color: AppColors.lightGreen,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            category.title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.textGreenColor,
            ),
          ),
        ],
      ),
    );
  }
}
