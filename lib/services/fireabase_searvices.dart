import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getAllFirestoreData(
      String collectionName) async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        _firebaseFirestore.collection(collectionName);

    return await collectionReference.get();
  }

  Future<void> uploadToFireStore(
      String collectionName, Map<String, dynamic> map) async {
    CollectionReference<Map<String, dynamic>> collectionReference =
        _firebaseFirestore.collection(collectionName);

    await collectionReference.add(map);
  }

  Future<String> uploadToFireStorage(String ref, File file) async {
    String fileNameWithExtension = file.path.split('/').last;
    String fileName = fileNameWithExtension.split('.').first;
    String fileExtension = fileNameWithExtension.split('.').last;

    final storageRef = _firebaseStorage
        .ref(ref)
        .child("$fileName${Random().nextDouble() * 40}.$fileExtension");
        
    final UploadTask uploadTask = storageRef.putFile(file);

    await uploadTask;

    final String downloadURL = await storageRef.getDownloadURL();
    return downloadURL;
  }
}
