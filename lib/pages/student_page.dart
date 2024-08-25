import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passwordtest/widgets/signOutButton.dart';
import 'package:passwordtest/widgets/studentForm.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  DocumentSnapshot? userDocRef;
  String? userDormName;
  String? userDocId;
  String? meetingId;
  String? userLastMeetingId;
  Timestamp? firebaseTimestamp;
  DateTime? mostRecentMeetingTimestamp;
  bool activeMeeting = false;
  bool buttonUpdateDatabase = true;

  @override
  void initState() {
    super.initState();
  }

  
  
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    print('Student page');

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            signOutButton(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: studentForm(db),
        ),
      ),
    );
  }
}

