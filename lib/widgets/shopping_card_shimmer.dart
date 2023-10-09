import 'package:flutter/material.dart';

class ShoppingCardShimmer extends StatelessWidget {
  const ShoppingCardShimmer({super.key});

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
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
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
