import 'package:edutime/config/theme/app_colors.dart';
import 'package:edutime/widget/event-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  final List<EventCard> events = [
    EventCard(),
    EventCard(),
    EventCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0.12.w, // Controls horizontal position of the indicator
        indicatorPosition: 0, // Centers the indicator in its allocated space
        connectorTheme: ConnectorThemeData(
          thickness: 2.0,
          color: Colors.blue,
          indent: 2.5
        ),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: events.length,
        contentsBuilder: (context, index) => Padding(padding: EdgeInsets.only(left: 8.w, bottom: 12.h), child: events[index],),
        indicatorBuilder: (context, index) => DotIndicator(
          color: Colors.blue,
          size: 16.0.w,
        ),
        connectorBuilder: (context, index, type) => SolidLineConnector(
          color: Colors.blue,
        ),
        oppositeContentsBuilder: (context, index) => Padding(padding: EdgeInsetsGeometry.only(right: 8.w), child: _durationTime('13:27', '15:27'),)
      ),
    );
  }


  Column _durationTime(String timeFrom, String timeTo) {
    return Column(
      spacing: 4.h,
      children: [
        Text(
          timeFrom,
          style: GoogleFonts.poppins(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w600,
            color: AppColors.gray700,
            height: 1.3
          ),
        ),
        Text(
          timeTo,
          style: GoogleFonts.poppins(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w400,
            color: AppColors.gray500,
            height: 1.3
          ),
        ),
      ],
    );
  }
}
