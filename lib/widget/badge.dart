import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Badge extends StatelessWidget {
  final Color? badgeBackgroundColor;
  final String badgeText;
  final Color? badgeTextColor;

  const Badge({super.key, this.badgeBackgroundColor, required this.badgeText, required this.badgeTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: badgeBackgroundColor,
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: Text(
        badgeText,
        softWrap: true,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: badgeTextColor,
          fontSize: 10.spMin,
          fontWeight: FontWeight.w500,
          height: 1.4
        ),
      ),
    );
  }
}