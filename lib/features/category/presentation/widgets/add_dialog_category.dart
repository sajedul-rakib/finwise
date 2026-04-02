import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:finwise/core/widgets/app_toast.dart';
import 'package:finwise/features/category/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_btn.dart';
import '../../../../core/widgets/form_input.dart';

void showAddDialog(
  BuildContext context, {
  required Future<String?> Function() addIcon,
  // Added String type to the callback
  Function(String title, String icon, CategoryType type)? onSaveCategory,
}) {
  final titleETController = TextEditingController();
  String? selectedIcon;
  CategoryType selectedType = CategoryType.expense; // Default selection

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          titleETController.addListener(() {
            if (context.mounted) setDialogState(() {});
          });

          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            backgroundColor: AppColors.honeydewGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      "New Category",
                      size: TextSize.xxl,
                      weight: AppFontWeight.extraBold,
                      color: AppColors.fenceGreen,
                    ),
                    const SizedBox(height: 25),

                    // --- TYPE SELECTION (RADIO BUTTONS) ---
                    RadioGroup<CategoryType>(
                      groupValue: selectedType,
                      onChanged: (CategoryType? type) {
                        setDialogState(() {
                          selectedType = type!;
                        });
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: RadioListTile<CategoryType>(
                              title: const AppText(
                                "Expense",
                                size: TextSize.lg,
                                weight: AppFontWeight.bold,
                              ),
                              value: CategoryType.expense,
                              activeColor: AppColors.caribbeanGreen,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<CategoryType>(
                              title: const AppText(
                                "Income",
                                size: TextSize.lg,
                                weight: AppFontWeight.bold,
                              ),
                              value: CategoryType.savings,
                              activeColor: AppColors.caribbeanGreen,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: FormInput(
                            hintText: "Enter title...",
                            controller: titleETController,
                            hintColor: AppColors.caribbeanGreen.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () async {
                            final String? picked = await addIcon();
                            if (picked != null) {
                              setDialogState(() {
                                selectedIcon = picked;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.caribbeanGreen,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: selectedIcon != null
                                ? SvgPicture.asset(
                                    'assets/category-icons/$selectedIcon',
                                    width: 25,
                                    height: 25,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.textGreenColor,
                                      BlendMode.srcIn,
                                    ),
                                  )
                                : Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 25,
                                    color: AppColors.textGreenColor,
                                  ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        "Preview",
                        size: TextSize.lg,
                        weight: AppFontWeight.medium,
                        color: AppColors.textGreenColor.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.caribbeanGreen.withValues(
                            alpha: 0.2,
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: selectedIcon != null
                            ? SvgPicture.asset(
                                'assets/category-icons/$selectedIcon',
                                width: 32,
                                colorFilter: ColorFilter.mode(
                                  selectedType == CategoryType.expense
                                      ? AppColors.errorColor
                                      : AppColors.oceanBlue,
                                  BlendMode.srcIn,
                                ),
                              )
                            : Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.honeydewGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.category, size: 20),
                              ),
                        title: AppText(
                          titleETController.text.isEmpty
                              ? "Category Title"
                              : titleETController.text,
                          size: TextSize.lg,
                          weight: AppFontWeight.bold,
                          color: AppColors.textGreenColor,
                        ),
                        subtitle: AppText(
                          selectedType.name.toUpperCase(),
                          size: TextSize.sm,
                          color: selectedType == CategoryType.expense
                              ? AppColors.errorColor
                              : AppColors.oceanBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    AppButton(
                      title: "Save Category",
                      onPressed: () {
                        if (titleETController.text.isNotEmpty &&
                            selectedIcon != null) {
                          onSaveCategory?.call(
                            titleETController.text,
                            selectedIcon!,
                            selectedType,
                          );
                        } else {
                          if (titleETController.text.isEmpty) {
                            AppToast.error(context, "Enter a meaningful title");
                          }
                          if (selectedIcon == null) {
                            AppToast.error(context, "Select a related icon");
                          }
                        }
                      },
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AppButton(
                      onPressed: () => Navigator.pop(context),
                      title: "Cancel",
                      bgColor: AppColors.lightGreen,
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
