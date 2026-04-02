import 'package:finwise/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.clickCategory,
  });

  final CategoryEntity category;
  final Function(BuildContext) clickCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clickCategory(context),
      child: Column(
        children: [
          Expanded(
            child: Container(
              // width: 100,
              // height: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/category-icons/${category.file}',
                  colorFilter: ColorFilter.mode(
                    AppColors.fenceGreen,
                    BlendMode.srcIn,
                  ),
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
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
