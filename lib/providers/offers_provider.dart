import 'package:bwi_assignment/models/offers_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/fireabase_searvices.dart';

class OffersProvider extends ChangeNotifier {
  OffersProvider() {
    fetchOffers();
  }
  FirebaseServices firebaseServices = FirebaseServices();

  final String _ref = 'offers';

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

  List<OffersModel> _offers = [];
  List<OffersModel> get getOffers => _offers;

  Future<void> fetchOffers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseServices.getAllFirestoreData(_ref);
      List<OffersModel> offers = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> data = document.data();
        offers.add(OffersModel(
          discount: data['discount'],
          image: data['image'],
          title: data['title'],
          subtitle: data['subtitle'],
        ));
        
      }

      _offers = offers;
      print(_offers.length);
      _isLoading = false;
      notifyListeners();

    } catch (e) {
      _isError = true;
      _errorMsg = 'Error fetching offers: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadOffer(OffersModel offersModel, image) async {
    _isError = false;
    _isUploading = true;
    _success = false;
    notifyListeners();
    try {
      String url = await firebaseServices.uploadToFireStorage(_ref, image);

      await firebaseServices.uploadToFireStore(
          _ref, offersModel.copyWith(image: url).toMap());
          
      _success = true;
      fetchOffers();
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
