import 'package:flutter/material.dart';
import 'package:flutter_api_calling_using_getx_statemanagement/controller/productcontroller.dart';
import 'package:get/get.dart';
import 'show_data.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagState();
}

class _HomePagState extends State<HomePage> {
  ProductController productController = Get.put(ProductController());
  String title = "Press Button And Load Data";
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                productController.loadData();
                setState(() {
                  title = "Please Wait....";
                });
              },
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
