import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/widgets/app_text_widget.dart';
import '../../data/datasource/category_icons_database.dart';

Future<String?> pickIcon(BuildContext context) async {
  return await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true, // Allows the sheet to take up more space
    backgroundColor: Colors.transparent, // Required for custom rounded corners
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 400), // Smooth slide up
    ),
    builder: (context) {
      return const IconPickerSheet();
    },
  );
}

class IconPickerSheet extends StatefulWidget {
  const IconPickerSheet({super.key});

  @override
  State<IconPickerSheet> createState() => _IconPickerSheetState();
}

class _IconPickerSheetState extends State<IconPickerSheet> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredIcons = CategoryIconsDatabase.search(searchQuery);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85, // 85% of screen height
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.honeydewGreen,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.textGreenColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  "Select an Icon",
                  size: TextSize.xxl,
                  weight: AppFontWeight.extraBold,
                  color: AppColors.textGreenColor,
                  fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Icon(
                    Icons.close,
                    size: 30,
                    color: AppColors.textGreenColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SearchBar(
              hintText: "Search Icons by your preferences ...",
              hintStyle: WidgetStatePropertyAll(
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                  color: AppColors.textGreenColor,
                ),
              ),
              elevation: WidgetStatePropertyAll(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(AppColors.lightGreen),
              onChanged: (query) => setState(() {
                searchQuery = query;
              }),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: filteredIcons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 icons per row looks cleaner
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final icon = filteredIcons[index];
                  return GestureDetector(
                    onTap: () => context.pop(icon['file']), // Return filename
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        'assets/category-icons/${icon['file']}',
                        colorFilter: ColorFilter.mode(
                          AppColors.voidGreen,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
