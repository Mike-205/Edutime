import 'package:edutime/components/calendar_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget Function(BuildContext)> appNavigationRoutes = {
  '/': (context) => CalendarScreen(),
};