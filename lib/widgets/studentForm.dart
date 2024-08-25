import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:passwordtest/widgets/studentButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Stream<QuerySnapshot> getUserDoc(FirebaseFirestore db) {
  final Query usersRef = db.collectionGroup('users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser!;
  final String userEmail = user.email!;

  return usersRef.where('email', isEqualTo: userEmail).snapshots();
}

Widget studentForm(FirebaseFirestore db) {
  return StreamBuilder(
    stream: getUserDoc(db),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const CircularProgressIndicator();
        default:
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error: ${snapshot.error}');
          } if (snapshot.hasData) {
            final userDocument = snapshot.data!.docs.first;
            return _studentForm(db, userDocument);
          } else {
            print('userDoc has no data');
            return Text('snapshot has no data');
          }
      }
    },
  );
}

Widget _studentForm(FirebaseFirestore db, dynamic userDocument) {
  var dormName = userDocument['dormName'];
  var userEmail = userDocument['email'];
  var userLastMeetingId = userDocument['lastMeetingId'];
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Text(dormName,
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Student: $userEmail",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      studentButton(db, userLastMeetingId, userDocument),
      const SizedBox(height: 32),
    ],
  );
}
