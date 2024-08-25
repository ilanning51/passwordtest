import 'package:flutter/material.dart';
import 'package:passwordtest/pages/faculty_page.dart';
import 'package:passwordtest/pages/student_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:passwordtest/main.dart';

class Switchboard extends StatefulWidget {
  @override
  _Switchboard createState() => _Switchboard();
}

class _Switchboard extends State<Switchboard> {
  bool isStudent = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('switchboard');
  }

  Future<String> getUserRole() async {
      final Query<Map<String, dynamic>> usersRef =
          FirebaseFirestore.instance.collectionGroup('users');
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User user = auth.currentUser!;
      final String userEmail = user.email!;

      final event = await usersRef.where('email', isEqualTo: userEmail).get();
      for (var doc in event.docs) {
        return doc.get('role');
      }
    
    return "no role found";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
    future: getUserRole(),
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data == 'faculty') {
          return const FacultyPage();
        } else {
          return StudentPage();
        }
      } else if (snapshot.hasError) {
        print(snapshot.error);
        return const Center(child: Text('Something Went Wrong'));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

}