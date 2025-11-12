import 'package:flutter/material.dart';
import '../models/exam_data.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget{
  final String indexNumber= "221093";

  @override
  Widget build(BuildContext context) {
    // sort by date
    examList.sort((a,b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - $indexNumber"),
      ),
      body: ListView.builder(
          itemCount: examList.length,
          itemBuilder: (context, i) {
        return ExamCard(exam: examList[i]);
      }),
      bottomNavigationBar: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16),
        child: Text("Вкупно испити: ${examList.length}",
        style: TextStyle(color: Colors.white,fontSize: 18),
        textAlign:TextAlign.center,
      ),
    ),
    );

  }
}