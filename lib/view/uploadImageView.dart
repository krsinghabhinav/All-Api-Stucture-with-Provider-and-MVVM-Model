import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yyyyyyyyy/response/status.dart';
import 'package:yyyyyyyyy/viewmodel/uploadImageViewModel.dart';

class UploadImageView extends StatefulWidget {
  const UploadImageView({super.key});

  @override
  State<UploadImageView> createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {
  File? selectImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Consumer<UploadImageProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (file != null) {
                    setState(() {
                      selectImage = File(file.path);
                    });
                  }
                },
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 400, // Adjust this height as needed
                      maxWidth: 300, // Adjust this width as needed
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: selectImage == null
                        ? Center(child: Text('Select image from Gallery'))
                        : Image.file(
                            selectImage!,
                            fit: BoxFit
                                .cover, // Adjust this to fit the image properly
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectImage != null) {
                    value.uploadImage(selectImage!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select an image first')),
                    );
                  }
                },
                child: value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      )
                    : Text("Upload Image"),
              ),
              Text("  ${value.uploadListVM.status}"),
            ],
          );
        },
      ),
    );
  }
}
