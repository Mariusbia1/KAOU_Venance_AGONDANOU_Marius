import 'package:flutter/material.dart';
import 'pages/candidate_list_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Élections', theme: ThemeData(
      primarySwatch: Colors.green, ), home: CandidateListPage(), );
  }
}