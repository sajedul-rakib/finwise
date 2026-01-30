import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';

class DateTitle extends StatelessWidget {
  const DateTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.fenceGreen,
      ),
    );
  }
}
