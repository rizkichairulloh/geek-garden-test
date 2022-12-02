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
  var listCategory = <String>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await getAllProduct();
    await getAllCategory();
    super.onInit();
  }

  Future getAllCategory() async {
    try {
      var response = await Dio().get('${Services.BASE_URL}/products/categories',
        options: Options(
          followRedirects: false,
          headers: {"Accept": "application/json",},
          validateStatus: (status) => true,
        ),);

      print(" : ${response.data}");
      if (response.statusCode == 200) {
        var data = response.data as List;
        for(int i = 0; i < data.length; i++) {
          listCategory.add(data[i]);
        }
        print("Kategori : " + listCategory.value.toString());
        // data.map((e) => listCategory.addAll(e)).toList();
      } else {
        await AlertApp.alertError("Warning!", "terjadi kesalahan teknis");
      }
    } catch (e) {
      e.toString();
    }
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
        product.value =  data.map((e) => ProductModel.fromJson(e)).toList();
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
        await AlertApp.alertSuccess("Sukses!", "produk berhasil dihapus !");
        Get.back();
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