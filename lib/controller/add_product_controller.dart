import 'package:dio/dio.dart';
import 'package:geek_garden_test/utilities/service.dart';
import 'package:geek_garden_test/widgets/alert.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  var listCategory = <String>[].obs;

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
        data.map((e) => listCategory.addAll(e)).toList();
      } else {
        await AlertApp.alertError("Warning!", "terjadi kesalahan teknis");
      }
    } catch (e) {
      e.toString();
    }
  }
}