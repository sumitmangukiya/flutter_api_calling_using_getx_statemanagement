import 'package:flutter/material.dart';
import 'package:flutter_api_calling_using_getx_statemanagement/controller/productcontroller.dart';
import 'package:get/get.dart';

import '../model/productmodel.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => productController.isLoading.value == true
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ProductDataSet.productsetList.length,
                  itemBuilder: (context, index) {
                    return ProductShowPage(
                        model: ProductDataSet.productsetList[index]);
                  })
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class ProductShowPage extends StatelessWidget {
  final ProductModel model;

  const ProductShowPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network("https:" + model.apiFeaturedImage.toString()),
          Divider(
            color: Colors.purple,
            height: 1,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.productColors!.length,
            itemBuilder: (context, index) {
              String hexColor = model.productColors![index].hexValue.toString(); // red color
              Color color = Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
              return Container(
                height: 10,
                width: 10,
                color: color,
              );
            },
          )
        ],
      ),
    ));
  }
}
