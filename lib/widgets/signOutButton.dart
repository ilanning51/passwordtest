import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget signOutButton() {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size.fromHeight(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      backgroundColor: const Color.fromARGB(255, 215, 215, 215),
    ),
    icon: const Icon(Icons.arrow_back, size: 16, color: Colors.black),
    label: const Text(
      'Sign Out',
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
    onPressed: () => FirebaseAuth.instance.signOut(),
  );
}