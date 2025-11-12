import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailsScreen extends StatelessWidget{
  final Exam exam;
  
  ExamDetailsScreen({
    required this.exam
});
  
  String timeUntilExam() {
    final now= DateTime.now();
    final diff = exam.dateTime.difference(now);

    if (diff.isNegative) {
      return "Испитот е веќе одржан";
    }
    
    final days=diff.inDays;
    final hours= diff.inHours % 24;
    
    return " До испитот преостанува: $days дена, $hours часа";
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subject),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Предмет: ${exam.subject}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
            Text("Време: ${exam.dateTime.hour.toString().padLeft(2,'0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
            SizedBox(height: 20),
            Text("Простории: ${exam.rooms.join(', ')}"),
            SizedBox(height: 30),
            Text("${timeUntilExam()}",
                style: TextStyle(fontSize: 18, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}