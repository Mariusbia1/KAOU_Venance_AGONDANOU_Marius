import 'package:flutter/material.dart';
import '../models/candidate.dart';
class CandidateCard extends StatelessWidget {
  final Candidate candidate;
  final VoidCallback onTap;
  CandidateCard({
    required this.candidate, required this.onTap, });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), ), child: Padding(
    padding: EdgeInsets.all(16), child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(16), child: Image.network(
    candidate.imageUrl, width: double.infinity, height: 150, fit: BoxFit.cover, ), ), SizedBox(height: 16), Text(
    '${candidate.name} ${candidate.firstName}', style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold, ), ), SizedBox(height: 8), Text(candidate.politicalParty), SizedBox(height: 8), Text(
    candidate.description, maxLines: 3, overflow: TextOverflow.ellipsis,
      ), ], ), ), ), );
  }
}