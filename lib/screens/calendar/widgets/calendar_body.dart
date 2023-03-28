import 'package:expire_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarBody extends StatefulWidget {
  const CalendarBody({Key? key}) : super(key: key);

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.week,
      specialRegions: _getTimeExpires(),
      showWeekNumber: true,
      weekNumberStyle: const WeekNumberStyle(
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(
            color: Styles.bgStartApp,
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
      cellEndPadding: 0,
      showNavigationArrow: true,
      todayHighlightColor: Styles.bgStartApp,
      cellBorderColor: Styles.colorDialogBox,
      backgroundColor: Styles.bgBackground,
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    ));
  }

  List<TimeRegion> _getTimeExpires() {
    final List<TimeRegion> Expires = <TimeRegion>[];
    Expires.add(TimeRegion(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      enablePointerInteraction: false,
      color: Styles.bgStartApp,
      text: 'apple',
      textStyle: const TextStyle(
        color: Styles.colorStartApp,
      ),
    ));

    return Expires;
  }
}
