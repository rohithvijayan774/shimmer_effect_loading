import 'package:flutter/material.dart';

class ShoppingCard extends StatelessWidget {
  final String imageURL;
  final String productTitle;
  final String productPrice;
  const ShoppingCard({
    super.key,
    required this.imageURL,
    required this.productTitle,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.247),
                offset: Offset(0, 10),
                spreadRadius: 5,
                blurRadius: 10)
          ],
          color: Color.fromARGB(255, 226, 226, 226),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        width: MediaQuery.of(context).size.width / 1.5,
        height: 500,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(imageURL),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    productTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    productPrice.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
