import 'package:geek_garden_test/model/product_model.dart';
import 'package:geek_garden_test/utilities/service.dart';
import 'package:geek_garden_test/widgets/alert.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var product = <ProductModel>[].obs;

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
        product.value =  data.map((e) => ProductModel.fromJson(e)).toList();
        isLoading.value = false;
      } else {
        isLoading.value = false;
        await AlertApp.alertError("Warning!", "terjadi kesalahan teknis");
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}