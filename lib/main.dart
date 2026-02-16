import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finwise/app.dart';
import 'package:finwise/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'features/splash/presentation/riverpod/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  final settingsBox = await Hive.openBox('settings');
  final authBox = await Hive.openBox("auth_box");
  final fireStore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseStorage = FirebaseStorage.instance;
  runApp(
    ProviderScope(
      overrides: [
        settingsBoxProvider.overrideWithValue(settingsBox),
        authBoxProvider.overrideWithValue(authBox),
        firebaseAuthProvider.overrideWithValue(firebaseAuth),
        firestoreProvider.overrideWithValue(fireStore),
        firebaseStorageProvider.overrideWithValue(firebaseStorage),
      ],
      child: const FinWiseApp(),
    ),
  );
}
