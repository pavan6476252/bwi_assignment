// ... (Previous imports and code remain unchanged)

import 'package:bwi_assignment/screens/auth/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/auth/login_page.dart';
import '../screens/home/home_page.dart';
import '../utils/show_scaffold.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? _user;
  String _verificationId = '';

  User? get user => _user;

  bool isLoading = false;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Future<void> verifyPhoneNumber(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          _user = auth.currentUser;
          notifyListeners();
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            // Handle invalid phone number error
            showAlertDialog(context, 'Error', 'Invalid phone number');
          } else {
            // Handle other verification failures
            showAlertDialog(
                context, 'Error', 'Verification failed: ${e.message}');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OptVerificationPage(),
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithPhoneNumber(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otpController.text,
      );
      await auth.signInWithCredential(credential);
      _user = auth.currentUser;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-verification-code') {
          // Handle invalid OTP
          showAlertDialog(context, 'Error', 'Invalid OTP');
        } else if (e.code == 'user-disabled') {
          // Handle blocked user
          showAlertDialog(context, 'Error', 'User is blocked');
        } else {
          // Handle other authentication errors
          showAlertDialog(
              context, 'Error', 'Authentication failed: ${e.message}');
        }
      } else {
        // Handle other errors
        showAlertDialog(context, 'Error', 'An unexpected error occurred');
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }

    
  }

  Future<void> logout(BuildContext context) async {
    await auth.signOut();
    _user = null; // Set _user to null after signing out
    notifyListeners();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

    Future<void> signInAnonymously(BuildContext context) async {
    try {
      await auth.signInAnonymously();
      _user = auth.currentUser;
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        showAlertDialog(
          context,
          'Error',
          'Anonymous sign-in failed: ${e.message}',
        );
      } else {
        showAlertDialog(
          context,
          'Error',
          'An unexpected error occurred during anonymous sign-in',
        );
      }
    }
  }
}
