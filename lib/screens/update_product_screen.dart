import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../models/product_model.dart';

import '../services/update_product.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = "UpdateProductScreen";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, description, image;

  double? price;
  bool isLoading = false;

// TODO: modal Progress hud
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                name: " name ",
                onChanged: (data) {
                  title = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                name: " description ",
                onChanged: (data) {
                  description = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                name: " price ",
                onChanged: (data) {
                  price = double.parse(data);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                name: " image ",
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  ProductModel updatedProduct = buildUpdateProduct(product);

                  await UpdateProduct().updateProduct(updatedProduct);

                  isLoading = false;

                  setState(() {



                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Updated Successfully"),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ProductModel buildUpdateProduct(ProductModel product) {
    try {
      return ProductModel(
          id: product.id,
          title: title == null ? product.title : title!,
          price: price == null ? product.price : price!,
          description: description == null ? product.description : description!,
          category: product.category,
          image: image == null ? product.image : image!,
          rating: product.rating);
    } catch (e) {
      debugPrint("updateModel error ${e.toString()} ");

      throw Exception(e.toString());
    }
  }
}
