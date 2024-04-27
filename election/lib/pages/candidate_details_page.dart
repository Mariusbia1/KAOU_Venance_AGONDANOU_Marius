import 'package:flutter/material.dart';
import '../models/candidate.dart';
import '../widgets/custom_app_bar.dart';
class CandidateDetailsPage extends StatelessWidget {
  final Candidate candidate;
  CandidateDetailsPage({required this.candidate});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Le Bloc Républicain'), body: Padding(
        padding: EdgeInsets.all(16), child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.network(
    candidate.imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover, ), ), SizedBox(height: 16), Text(
    '${candidate.name} ${candidate.firstName}', style: TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold, ), ), SizedBox(height: 8), Text(candidate.politicalParty), SizedBox(height: 16), Text(
    candidate.description, style: TextStyle(
    fontSize: 16,
      ), ), ],
    ), ), );
  }
}