import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Background image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.8),
            ),
          ),
         Column(
           children: [
             Padding(
               padding: EdgeInsets.only(top: 10.0),
             ),
             Row(
               children: [
                 Padding(padding: EdgeInsets.only(left: 35.0)),
                 ClipRRect(
                   child: Image.asset(
                     "images/Scissors_Main_logo-removebg-preview.png",
                     height: 80,
                     width: 80,
                   ),
                 ),
               ],
             ),
             Row(
               children: [
                 Padding(padding: EdgeInsets.only(left: 20)),
                 Text(
                   "Scissor's",
                   style: AppFonts.getHeadingStyle(),
                 ),
               ],
             ),
           ],
         ),
          Center(
            child: Card(
              margin: EdgeInsets.all(150.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CHOOSE YOUR DATE",
                          style: AppFonts.getSubHeadingStyle(),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 35),
                            backgroundColor: Colors.brown,
                          ),
                          child: Text(
                            'SELECT DATE',
                            style: AppFonts.getDescriptionStyle(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: HorizontalWeekCalendarPackage(
                        selectedDate: selectedDate,
                        key: ValueKey<String>('your_key_value_here'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
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

  const HorizontalWeekCalendarPackage(
      {required Key key, required this.selectedDate})
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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.redAccent,
                  width: 2.0,
                ),
              ),
            ),
            child: Text(
              DateFormat('MMMM d, yyyy').format(widget.selectedDate),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
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
            child: Text(
              'BOOK YOUR APPOINTMENT',
              style: AppFonts.getDescriptionStyle(),
            ),
          ),
        ],
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
