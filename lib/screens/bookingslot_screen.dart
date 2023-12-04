import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';

class BookingSlotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[700],//blueGrey[700],
      body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0,)),

            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
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
            SizedBox(height: 8,),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 25)),
                Text(
                  "Scissor's",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'robotomoto'),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("SELECT YOUR DATE" , style: GoogleFonts.lato(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 10),
            Expanded(child: HorizontalWeekCalendarPackage(),)
          ]

      ),

    );
  }
}
class HorizontalWeekCalendarPackage extends StatefulWidget {
  const HorizontalWeekCalendarPackage({super.key});

  @override
  State<HorizontalWeekCalendarPackage> createState() =>
      _HorizontalWeekCalendarPackageState();
}

class _HorizontalWeekCalendarPackageState
    extends State<HorizontalWeekCalendarPackage> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: HorizontalWeekCalendar(
                    weekStartFrom: WeekStartFrom.Monday,
                    activeBackgroundColor: Colors.purple,
                    activeTextColor: Colors.white,
                    inactiveBackgroundColor: Colors.purple.withOpacity(.3),
                    inactiveTextColor: Colors.white,
                    disabledTextColor: Colors.grey,
                    disabledBackgroundColor: Colors.grey.withOpacity(.3),
                    activeNavigatorColor: Colors.purple,
                    inactiveNavigatorColor: Colors.grey,
                    monthColor: Colors.purple,
                    onDateChange: (date) {
                      setState(() {
                        selectedDate = date;
                        // Check if the selected date is in the next year
                        if (date.year > DateTime.now().year) {
                          // Do something when moving to the next year
                          print('Moving to the next year');
                        }
                      });
                    },
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            SizedBox(height: 10,)
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            SizedBox(height: 10)
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                            onPressed: (){},
                            child: Text('10:00 AM - 11:00 AM')
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}