import 'dart:io';

import 'package:bwi_assignment/providers/categories_provider.dart';
import 'package:bwi_assignment/screens/forms/offers_form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CategoryForm extends StatefulWidget {
  CategoryForm({Key? key}) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  File? image;
  TextEditingController textEditingController = TextEditingController();

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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Consumer<CategoryProvider>(
                builder: (context, value, child) {
                  return Column(
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
                          labelText: "Image Title",
                          border: OutlineInputBorder(),
                        ),
                        controller: textEditingController,
                      ),
                  SizedBox(height: 8),

                      ElevatedButton(
                        onPressed: () {
                          if (image != null) {
                            context.read<CategoryProvider>().uploadCategories(
                                textEditingController.text, image!);
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
                  );
                },
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
