import 'package:flutter/material.dart';
import '../models/candidate.dart';
import '../widgets/candidate_card.dart';
import '../widgets/custom_app_bar.dart';
import 'candidate_details_page.dart';
import 'new_candidate_page.dart';
class CandidateListPage extends StatefulWidget {
  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}
class _CandidateListPageState extends State<CandidateListPage> {
  final List<Candidate> candidates = [
    Candidate(
      name: 'Talata', firstName: 'Zime Yerima', politicalParty: 'Le Bloc Républicain', description: 'Candidat avec une longue expérience politique.', imageUrl: 'https://example.com/candidate1.jpg', birthDate: DateTime(1970, 5, 15), ), // Ajoutez d'autres candidats ici
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Élections'), body: ListView.builder(
      itemCount: candidates.length, itemBuilder: (context, index) {
      final candidate = candidates[index];
      return CandidateCard(
        candidate: candidate, onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => CandidateDetailsPage(candidate: candidate), ), );
      }, );
    }, ),floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => NewCandidatePage(
          onCandidateAdded: (newCandidate) {
        setState(() {
          candidates.add(newCandidate);
        });
          }, ), ), );
        }, child: Icon(Icons.add), backgroundColor: Colors.green, ), bottomNavigationBar: BottomNavigationBar(
        items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.people), label: 'Candidats', ),BottomNavigationBarItem(
    icon: Icon(Icons.how_to_vote), label: 'Vote', ),BottomNavigationBarItem(
    icon: Icon(Icons.settings), label: 'Paramètres',
          ), ], ), );
  }
}