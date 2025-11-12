import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_details_screen.dart';


class ExamCard extends StatelessWidget{
  final Exam exam;
  
  ExamCard({
    required this.exam
});
  
  @override
  Widget build(BuildContext context) {
    bool isPast= exam.dateTime.isBefore(DateTime.now());
    
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: isPast ? Colors.grey[300] : Colors.green[100],
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ListTile(
          title: Text(exam.subject, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 18),
                  SizedBox(width: 6),
                  Text("${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.access_time, size: 18),
                  SizedBox(width: 6),
                  Text("${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.room, size: 18),
                  SizedBox(width: 6),
                  Expanded(child: Text(exam.rooms.join(", "))),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ExamDetailsScreen(exam: exam)));
          },
        ),
      ),
    );
  }
}