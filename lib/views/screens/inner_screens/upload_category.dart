import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maclay_shop_node_project/services/category_service.dart';

class UploadCategory extends StatefulWidget {
  const UploadCategory({super.key});

  @override
  State<UploadCategory> createState() => _UploadCategoryState();
}

class _UploadCategoryState extends State<UploadCategory> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryService _categoryService = CategoryService();
  late String categoryName;
  final ImagePicker picker = ImagePicker();
  File? _image;
  File? _pickBanner;

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      print('no image picked');
    } else {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  chooseBanner() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      print('no image picked');
    } else {
      setState(() {
        _pickBanner = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        border: Border.all(color: Colors.grey.shade800),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: _image != null
                            ? Image.file(_image!)
                            : const Text(
                                'Upload Image',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          chooseImage();
                        },
                        child: const Text(
                          'Upload Image',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    onChanged: (value) {
                      categoryName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter category name';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Category Name',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    border: Border.all(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: _pickBanner != null
                        ? Image.file(_pickBanner!)
                        : const Text(
                            'Upload Image',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      chooseBanner();
                    },
                    child: const Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.blue.shade900,
              ),
            ),
          ),
          onPressed: () {
            _categoryService.uploadCategory(
                context: context,
                name: categoryName,
                pickedImage: _image,
                pickedBanner: _pickBanner);
          },
          child: const Text(
            'Save',
          ),
        ),
      ),
    );
  }
}
