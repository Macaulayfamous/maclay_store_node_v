import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maclay_shop_node_project/models/category_models.dart';
import 'package:maclay_shop_node_project/services/product_service.dart';

import '../../../services/category_service.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final CategoryService _categoryService = CategoryService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProductService _productService = ProductService();
  late String name;
  String? selectedCategory;
  late Future<List<CategoryModel>> _categoriesFuture;
  String? productName;
  int? productPrice;
  int? discount;
  int? quantity;
  String? description;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _loadCategories();
  }

  Future<List<CategoryModel>> _loadCategories() async {
    return _categoryService.loadCategories();
  }

  final ImagePicker picker = ImagePicker();
  List<File> image = [];
  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      print('no image picked');
    } else {
      setState(() {
        image.add(File(pickedFile.path));
      });
    }
  }

  uploadProduct() {
    _productService.sellerProduct(
        context: context,
        productName: productName.toString(),
        productPrice: productPrice!.toInt(),
        discount: discount!.toInt(),
        quantity: quantity!.toInt(),
        description: description.toString(),
        pickedImages: image,
        category: selectedCategory.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: image.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      childAspectRatio: 3 / 3),
                  itemBuilder: ((context, index) {
                    return index == 0
                        ? Center(
                            child: IconButton(
                                onPressed: () {
                                  chooseImage();
                                },
                                icon: const Icon(Icons.add)),
                          )
                        : SizedBox(
                            width: 50,
                            height: 40,
                            child: Image.file(
                              image[index - 1],
                              width: 40,
                              height: 50,
                            ),
                          );
                  }),
                ),
                TextFormField(
                  onChanged: (value) {
                    productName = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter field';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter product name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      productPrice = int.parse(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter field';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter product price',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    onChanged: (value) {
                      quantity = int.parse(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter field';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter  quantity',
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    onChanged: (value) {
                      discount = int.parse(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter field';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter  discount',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 20),
                FutureBuilder<List<CategoryModel>>(
                  future: _categoriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return const Text('No categories found');
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Categories:'),
                          DropdownButton<String>(
                            hint: const Text('select category'),
                            value: selectedCategory,
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                            items: snapshot.data!
                                .map<DropdownMenuItem<String>>((category) {
                              return DropdownMenuItem<String>(
                                value: category.name,
                                child: Text(category.name),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    description = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter field';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'product Description',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: ElevatedButton(
        onPressed: () {
          if (image.isNotEmpty) {
            if (_formKey.currentState!.validate()) {
              uploadProduct();
            }
          }
        },
        child: const Text(
          'upload',
        ),
      ),
    );
  }
}
