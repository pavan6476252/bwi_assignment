import 'dart:io';
import 'package:bwi_assignment/models/offers_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bwi_assignment/providers/offers_provider.dart';
import 'package:provider/provider.dart';

class OfferForm extends StatefulWidget {
  @override
  _OfferFormState createState() => _OfferFormState();
}

class _OfferFormState extends State<OfferForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  File? image;

  Future<void> _pickImage() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      setState(() {
        image = File(xFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OffersProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (image != null) Image.file(image!),
                  ElevatedButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child: const Text("Pick Image"),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                    ),
                    controller: titleController,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Subtitle",
                      border: OutlineInputBorder(),
                    ),
                    controller: subtitleController,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Discount",
                      border: OutlineInputBorder(),
                    ),
                    controller: discountController,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (image != null) {
                        final offer = OffersModel(
                          title: titleController.text,
                          subtitle: subtitleController.text,
                          discount: double.parse(discountController.text),
                          image: "",
                        );
                        context
                            .read<OffersProvider>()
                            .uploadOffer(offer, image);
                      }
                    },
                    child: value.getIsUploading
                        ? CircularProgressIndicator()
                        : const Text("Upload"),
                  ),
                  if (value.getIsSuccess)
                    FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return SnackBar(
                          content: Text("Success"),
                          backgroundColor: Colors.greenAccent,
                        );
                      },
                    ),
                  if (value.isError)
                    FutureBuilder(
                      future: Future.delayed(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return SnackBar(
                          content: Text(value.getErrorMsg),
                          backgroundColor: Colors.redAccent,
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
