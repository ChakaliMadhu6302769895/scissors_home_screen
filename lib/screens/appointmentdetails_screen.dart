
import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final DateTime selectedDate;
  final List<String> selectedTimeSlots;

  AppointmentDetailsScreen({required this.selectedDate, required this.selectedTimeSlots});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Date: ${selectedDate.toLocal()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Time Slots:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Column(
              children: selectedTimeSlots
                  .map((timeSlot) => Text(
                timeSlot,
                style: TextStyle(fontSize: 16),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
