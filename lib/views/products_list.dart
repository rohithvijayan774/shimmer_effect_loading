import 'dart:convert';

import 'package:api_test/widgets/shopping_card.dart';
import 'package:api_test/widgets/shopping_card_shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  var data;
  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        fetchProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
      ),
      body: FutureBuilder(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ShoppingCardShimmer();
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('No Network'),
            );
          } else {
            return ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ShoppingCard(
                  imageURL: data[index]['image'],
                  productTitle: data[index]['title'],
                  productPrice: data[index]['price'].toString(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
