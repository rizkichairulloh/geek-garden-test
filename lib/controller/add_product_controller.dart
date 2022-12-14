import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geek_garden_test/utilities/service.dart';
import 'package:geek_garden_test/widgets/alert.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  var isLoading = false.obs;
  var title = TextEditingController().obs;
  var category = TextEditingController().obs;
  var price = TextEditingController().obs;
  var image = TextEditingController().obs;
  var description = TextEditingController().obs;
  String? selectedValue;

  //tambah produk ke api
  Future postProduct() async {
    isLoading.value = true;
    try {
      var response = await Dio().post('${Services.BASE_URL}/products',
        options: Options(
          followRedirects: false,
          headers: {"Accept": "application/json",},
          validateStatus: (status) => true,
        ),
        queryParameters: {
          'title': title.value.text,
          'price' : price.value.text,
          'description': description.value.text,
          'image': image.value.text,
          'category': category.value.text
        }
      );

      print(" : ${response.data}");
      if (response.statusCode == 200) {
        await AlertApp.alertSuccess("Sukses!", "produk berhasil ditambahkan !");
        Get.toNamed('/home');
        isLoading.value = false;
      } else {
        await AlertApp.alertError("Warning!", "terjadi kesalahan teknis");
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}