import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/get_all_product.dart';
import '../widgets/card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "New Trend ",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              size: 26,
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: GetAllProducts().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel>   products=snapshot.data!;
                return GridView.builder(

                  clipBehavior: Clip.none,
                  itemCount: products.length,

                  itemBuilder: (context, index) =>  CardItem( product:products[index]),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 1),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
