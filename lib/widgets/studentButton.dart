import 'dart:math';
import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:intl/intl.dart';
import 'package:passwordtest/widgets/lastMeetingText.dart';

Widget studentButton(FirebaseFirestore db, String userLastMeetingId, dynamic userDocument) {
  return StreamBuilder<QuerySnapshot>(
    stream: db
        .collectionGroup('meetings')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print('Connection State: ${snapshot.connectionState}');
      print('Has Data: ${snapshot.hasData}');
      print('Has Error: ${snapshot.hasError}');

      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          print('Waiting for changes...');
          return const Text(''); // Placeholder text while waiting for data
        default:
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            if (snapshot.data!.docs.isNotEmpty) {
              print('Got the document');
              final latestMeetingDoc = snapshot.data!.docs.first;
              print(latestMeetingDoc.toString()); // Print document data

              final now = DateTime.now();
              final oneHourAgo = now.subtract(const Duration(hours: 1));

              final Timestamp firestoreMeetingTimestamp =
                  latestMeetingDoc['timestamp'];
              var mostRecentMeetingTimestamp =
                  firestoreMeetingTimestamp.toDate();
              print('Meeting Timestamp: $mostRecentMeetingTimestamp');
              var activeMeeting =
                  mostRecentMeetingTimestamp.isAfter(oneHourAgo);

              var dormLastMeetingId = latestMeetingDoc.id;

              if (activeMeeting) {
                print('Active Meeting: $activeMeeting');
                print('meetingsMeetingid $dormLastMeetingId');
                return _studentButton(context, dormLastMeetingId, userLastMeetingId, userDocument);
              } else {
                print('no active meeting');
                String formattedDate =
                    DateFormat.yMMMEd().format(mostRecentMeetingTimestamp);
                String formattedTime =
                    DateFormat.jm().format(mostRecentMeetingTimestamp);
                return lastMeetingText(formattedDate, formattedTime);
              }
            } else {
              // Handle the case where there are no documents
              return const Text('No meetings available');
            }
          } else {
            return const Text('No data available');
          }
      }
    },
  );
}

Widget _studentButton(BuildContext context, String dormLastMeetingId, String userLastMeetingId, dynamic userDocument) {
  if (dormLastMeetingId != userLastMeetingId) {
    return AnimatedButton(
      shape: BoxShape.circle,
      height: 256,
      width: 256,
      shadowDegree: ShadowDegree.light,
      color: const Color.fromARGB(255, 215, 215, 215),
      child: const Text(
        'On My Way!',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        userDocument!.reference.update({'lastMeetingId': dormLastMeetingId});
        print(userLastMeetingId);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Message Sent')));

        Confetti.launch(
          context,
          options:
              const ConfettiOptions(particleCount: 200, spread: 360, y: 0.6),
        );
      },
    );
  } else {
    return TextButton(
      onLongPress: () {
        Confetti.launch(
          context,
          options:
              const ConfettiOptions(particleCount: 300, spread: 360, y: 0.6),
        );
      },
      child: const Text(
        'Hurry downstairs!',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        double randomInRange(double min, double max) {
          return min + Random().nextDouble() * (max - min);
        }

        Confetti.launch(
          context,
          options: ConfettiOptions(
              angle: randomInRange(55, 125),
              spread: randomInRange(50, 70),
              particleCount: randomInRange(50, 100).toInt(),
              y: 0.6),
        );
      },
    );
  }
}
