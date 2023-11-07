import 'package:bwi_assignment/screens/forms/category_form.dart';
import 'package:bwi_assignment/screens/forms/offers_form.dart';
import 'package:flutter/material.dart';

class UploadForm extends StatelessWidget {
  const UploadForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("upload"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryForm(),
            // upload offers banners
            OfferForm(),
          ],
        ),
      ),
    );
  }
}
