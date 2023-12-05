import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/theme.dart';

class BookingSlotScreen extends StatefulWidget {
  @override
  _BookingSlotScreenState createState() => _BookingSlotScreenState();
}

class _BookingSlotScreenState extends State<BookingSlotScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10.0,
          ),
        ),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left:20.0)),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "images/logo scissors project.jpg",
                height: 100,
                width: 100,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 15)),
            Text(
              "Scissor's",
                style: AppFonts.getHeadingStyle(),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CHOOSE YOUR DATE",
                style: AppFonts.getSubHeadingStyle(),
            )
          ],
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            _selectDate(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 35), backgroundColor: Colors.red,
          ),
          child: Text(
            'SELECT DATE',
            style: AppFonts.getDescriptionStyle(),
          ),
        ),

        SizedBox(height: 10),
        Expanded(
          child: HorizontalWeekCalendarPackage(
            selectedDate: selectedDate,
            key: ValueKey<String>('your_key_value_here'),
          ),

        )
      ]),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

class HorizontalWeekCalendarPackage extends StatefulWidget {
  final DateTime selectedDate;

  const HorizontalWeekCalendarPackage({required Key key, required this.selectedDate})
      : super(key: key);

  @override
  State<HorizontalWeekCalendarPackage> createState() =>
      _HorizontalWeekCalendarPackageState();
}

class _HorizontalWeekCalendarPackageState
    extends State<HorizontalWeekCalendarPackage> {
  Map<String, Color> buttonColors = {
    '10:00 AM - 11:00 AM': Colors.green,
    '02:00 PM - 03:00 PM': Colors.green,
    '05:00 PM - 06:00 PM': Colors.green,
    '11:00 AM - 12:00 PM': Colors.green,
    '03:00 PM - 04:00 PM': Colors.green,
    '06:00 PM - 07:00 PM': Colors.green,
    '12:00 PM - 01:00 PM': Colors.green,
    '04:00 PM - 05:00 PM': Colors.green,
    '07:00 PM - 08:00 PM': Colors.green,
  };

  void toggleButtonColor(String time) {
    setState(() {
      buttonColors.forEach((key, value) {
        buttonColors[key] = Colors.green;
      });
      buttonColors[time] =
      (buttonColors[time] == Colors.green) ? Colors.red : Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                         color: Colors.white70,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      DateFormat('MMMM d, yyyy').format(widget.selectedDate),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                       color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Text(
                "PICK YOUR SLOT",
                style: AppFonts.getSubHeadingStyle(),
              ),
              SizedBox(height: 10),
              buildTimeSlotsColumn(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('BOOK YOUR APPOINTMENT' ,style: AppFonts.getDescriptionStyle(),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimeSlotsColumn() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTimeSlotColumn([
            '10:00 AM - 11:00 AM',
            '02:00 PM - 03:00 PM',
            '05:00 PM - 06:00 PM',
          ]),
          SizedBox(width: 15),
          buildTimeSlotColumn([
            '11:00 AM - 12:00 PM',
            '03:00 PM - 04:00 PM',
            '06:00 PM - 07:00 PM',
          ]),
          SizedBox(width: 15),
          buildTimeSlotColumn([
            '12:00 PM - 01:00 PM',
            '04:00 PM - 05:00 PM',
            '07:00 PM - 08:00 PM',
          ]),
        ],
      ),
    );
  }

  Widget buildTimeSlotColumn(List<String> timeSlots) {
    return Column(
      children: timeSlots
          .map(
            (time) => Column(
          children: [
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: buttonColors[time]),
              onPressed: () {
                toggleButtonColor(time);
              },
              child: Text(time),
            ),
            SizedBox(height: 10),
          ],
        ),
      )
          .toList(),
    );
  }
}
