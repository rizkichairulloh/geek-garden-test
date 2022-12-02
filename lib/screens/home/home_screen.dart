import 'package:flutter/material.dart';
import 'package:geek_garden_test/controller/home_controller.dart';
import 'package:geek_garden_test/screens/home/item_product.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:geek_garden_test/utilities/typography.dart';
import 'package:geek_garden_test/widgets/appbar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GEEK GARDEN TEST", style: kTextHeader3Bold.copyWith(color: kColorWhite),),
        backgroundColor: kColorGreen,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Obx(() => _controller.isLoading.value != true ? ListView.builder(
          itemCount: _controller.product.length,
          itemBuilder: (context, index) {
            print(_controller.product[index].title);
            return ItemProduct(
                title: _controller.product[index].title!,
                onTap: () {

                },
                imageUrl: _controller.product[index].image!);
          },
        ) : const Center(
          child: CircularProgressIndicator(),
        ))
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/add-product");
        },
        tooltip: 'Tambah Produk',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
