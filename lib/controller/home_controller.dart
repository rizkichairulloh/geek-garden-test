import 'dart:convert';

import 'package:geek_garden_test/model/product_model.dart';
import 'package:geek_garden_test/utilities/service.dart';
import 'package:geek_garden_test/widgets/alert.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var isLoadingDelete = false.obs;
  var product = <ProductModel>[].obs;
  var cek = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllProduct();
    super.onInit();
  }

  Future getAllProduct() async {
    isLoading.value = true;

    try {
      var response = await Dio().get('${Services.BASE_URL}/products',
        options: Options(
          followRedirects: false,
          headers: {"Accept": "application/json",},
          validateStatus: (status) => true,
        ),);

      if (response.statusCode == 200) {
        var data = response.data as List;
        print("DATA : ${data.toString()}");
        List<ProductModel> list = [];
        for (int i = 0; i < data.length; i++) {
          print("DATA LOOPING : ${data[i]['id']}");
          list.add(ProductModel(
            id: data[i]['id'],
            title: data[i]['title'],
            description: data[i]['description'],
            image: data[i]['image'],
            category: data[i]['category'],
            // price: data[i]['price'],
            // rating: data[i]['rating'],
          ));

        }
        product.value = list;
        // product.value =  data.map((e) => ProductModel.fromJson(e)).toList();
        print("DATA : ${product.value}");
        isLoading.value = false;
      } else {
        isLoading.value = false;
        await AlertApp.alertError("Warning!", "terjadi kesalahan teknis");
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future postDelete(String id) async {
    isLoadingDelete.value = true;

    try {
      var response = await Dio().delete('${Services.BASE_URL}/products/$id',
        options: Options(
          followRedirects: false,
          headers: {"Accept": "application/json",},
          validateStatus: (status) => true,
        ),);

      if (response.statusCode == 200) {
        await getAllProduct();
        Get.back();
        AlertApp.alertSuccess("Sukses!", "produk berhasil dihapus !");
        isLoadingDelete.value = false;
      } else {
        isLoadingDelete.value = false;
        Get.back();
        await AlertApp.alertError("Warning!", "terjadi kesalahan teknis");
      }
    } catch (e) {
      isLoadingDelete.value = false;
    }
  }
}