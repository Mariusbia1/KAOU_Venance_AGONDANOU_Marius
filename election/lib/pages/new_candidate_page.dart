import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../models/candidate.dart';
class NewCandidatePage extends StatefulWidget {
  final Function(Candidate) onCandidateAdded;
  NewCandidatePage({required this.onCandidateAdded});
  @override
  _NewCandidatePageState createState() => _NewCandidatePageState();
}
class _NewCandidatePageState extends State<NewCandidatePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _firstName = '';
  String _politicalParty = '';
  String _description = '';
  DateTime _birthDate = DateTime.now();
  String _imageUrl = '';
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() { _imageUrl = pickedFile.path;
      });
    }
  }
  void _saveCandidate() {
    if (_formKey.currentState!.validate()) { _formKey.currentState!.save();
    final newCandidate = Candidate(
        name: _name, firstName: _firstName, politicalParty: _politicalParty
      description: _description, imageUrl: _imageUrl, birthDate: _birthDate, );
    widget.onCandidateAdded(newCandidate);
    Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Création de candidat')
        ), body: Padding(
        padding: EdgeInsets.all(16), child: Form(
    key: _formKey, child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch, children: [
    GestureDetector(
    onTap: _pickImage, child: Container(
    height: 150, decoration: BoxDecoration(
    color: Colors.grey[300], borderRadius: BorderRadius.circular(16), ), child: _imageUrl.isNotEmpty
    ? ClipRRect(
    borderRadius: BorderRadius.circular(16), child: Image.file(
    File(_imageUrl), fit: BoxFit.cover, ), )
        : Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center, children: [
    Icon(Icons.add_a_photo, size: 32), SizedBox(height: 8), Text('Appuyez pour ajouter une image')
    ], ), ), ), ),
    SizedBox(height: 16), TextFormField(
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.person), hintText: 'Nom', border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16), ), ), validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer le nom du candidat';
    }
    return null;
    }, onSaved: (value) { _name = value!;
    }, ), SizedBox(height: 16), TextFormField(
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.person), hintText: 'Prénom(s)', border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16), ), ), validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer le(s) prénom(s) du candidat';
    }
    return null;
    }, onSaved: (value) { _firstName = value!;
    }, ), SizedBox(height: 16), TextFormField(
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.flag), hintText: 'Parti politique', border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16), ), ), validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer le parti politique du candidat';
    }
    return null;
    }, onSaved: (value) { _politicalParty = value!;
    }, ), SizedBox(height: 16), TextFormField(
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.description), hintText: 'Description', border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16), ), ), maxLines: 3, validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Veuillez entrer une description du candidat';
    }
    return null;
    }, onSaved: (value) { _description = value!;
    }, ), SizedBox(height: 16), Row(
    children: [
    Expanded(
    child: TextButton(
    onPressed: () async {
    final selectedDate = await showDatePicker(
    context: context, initialDate: _birthDate, firstDate: DateTime(1900), lastDate: DateTime.now(), );
    if (selectedDate != null) {
    setState(() { _birthDate = selectedDate;
    });
    }
    },
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center, children: [
    Icon(Icons.calendar_today), SizedBox(width: 8),
    Text('Date de naissance'), ], ), ), ), ], ), SizedBox(height: 16), ElevatedButton(
    onPressed: _saveCandidate, child: Text('SAUVEGARDER'), style: ElevatedButton.styleFrom(
    primary: Colors.green, shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
      ), ), ), ], ), ), ), );
  }
}