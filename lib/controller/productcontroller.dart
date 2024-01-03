import 'dart:convert';
import 'package:flutter_api_calling_using_getx_statemanagement/model/productmodel.dart';
import 'package:flutter_api_calling_using_getx_statemanagement/page/show_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var isLoading = false.obs;

  loadData() async {
    print("Loading Data");
    var response = await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'));
    // print(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      ProductDataSet.productsetList =
          List.from(responseData).map((e) => ProductModel.fromJson(e)).toList();
      isLoading.value = true;
      Get.to(() => ShowData());
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
  }
}

class ProductDataSet {
  static List<ProductModel> productsetList = [];
}
