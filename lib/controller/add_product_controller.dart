import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geek_garden_test/utilities/service.dart';
import 'package:geek_garden_test/widgets/alert.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  var isLoading = false.obs;
  var listCategory = <String>[].obs;
  var title = TextEditingController().obs;
  var category = TextEditingController().obs;
  var price = TextEditingController().obs;
  var image = TextEditingController().obs;
  var description = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllCategory();
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
          // 'title': 'test product',
          // 'price' : '13',
          // 'description': 'lorem ipsum set',
          // 'image': 'https://i.pravatar.cc',
          //  'category': 'electronic'
          'title': title.value.text,
          'price' : price.value.text.replaceAll(".", ""),
          'description': description.value.text,
          'image': image.value.text,
          'category': category.value.text
        }
      );

      print(" : ${response.data}");
      if (response.statusCode == 200) {
        AlertApp.alertSuccess("Sukses!", "produk berhasil ditambahkan !");
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