import 'dart:io';

import 'package:bwi_assignment/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../services/fireabase_searvices.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    fetchCategories();
  }
  FirebaseServices firebaseServices = FirebaseServices();

  final String _ref = 'categories';

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  String _errorMsg = '';
  String get getErrorMsg => _errorMsg;

  bool _isUploading = false;
  bool get getIsUploading => _isUploading;
  bool _success = false;
  bool get getIsSuccess => _success;

  List<CategoryModel> categories = [];
  List<CategoryModel> get getCategories => categories;

  Future<void> fetchCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseServices.getAllFirestoreData(_ref);
      List<CategoryModel> categoryList = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> data = document.data();
        categoryList.add(CategoryModel(
          image: data['image'],
          title: data['title'],
        ));
      }

      categories = categoryList;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isError = true;
      _errorMsg = 'Error fetching categories: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadCategories(String title, File file) async {
    _isError = false;
    _isUploading = true;
    _success = false;
    notifyListeners();
    try {
      String url = await firebaseServices.uploadToFireStorage(_ref, file);
      _success = true;

      CategoryModel categoryModel = CategoryModel(image: url, title: title);

      await firebaseServices.uploadToFireStore(_ref, categoryModel.toMap());
      fetchCategories();
      
    } on FirebaseException catch (e) {
      _isError = true;
      _errorMsg = e.message ?? 'An error occurred';
    } finally {
      _isLoading = false;
      _isUploading = false;
      notifyListeners();
      Future.delayed(const Duration(seconds: 1));
      _success = false;
      notifyListeners();
    }
  }
}
