import 'package:edutime/config/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'badge.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(16.r)
      ),
      child: Column(
        spacing: 12.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    Text(
                      'Lesson 1: ACSC 101',
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        fontSize: 14.spMin,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray900,
                        height: 1.2
                      ),
                    ),
                    Text(
                      'Data Structures and Algorithms',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        color: AppColors.gray500,
                        height: 1.3
                      ),
                    )
                  ],
                ),
              ),
              Icon(
                LucideIcons.moreVertical,
                size: 20.w,
                color: AppColors.gray400,
              )
            ],
          ),
          Column(
            spacing: 4.h,
            children: [
              Row(
                spacing: 8.w,
                children: [
                  Icon(
                    LucideIcons.mapPin,
                    size: 16.w,
                    color: AppColors.gray400,
                  ),
                  Text(
                    'BSR: 204',
                    style: GoogleFonts.inter(
                      fontSize: 13.spMin,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray400,
                      height: 1.5
                    ),
                  )
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      spacing: 8.w,
                      children: [
                        Icon(
                          LucideIcons.repeat,
                          size: 16.w,
                          color: AppColors.gray400,
                        ),
                        Expanded(
                          child: Text(
                            'Every Mon, Tue',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 13.spMin,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray400,
                              height: 1.5
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Badge(badgeText: 'Lecture', badgeTextColor: AppColors.warning500, badgeBackgroundColor: AppColors.warning300.withAlpha((0.25 * 255).toInt()))
                ]
              ),
            ],
          )
        ],
      ),
    );
  }
}