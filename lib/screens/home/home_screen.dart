import 'package:flutter/material.dart';
import 'package:geek_garden_test/controller/home_controller.dart';
import 'package:geek_garden_test/screens/home/item_product.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:geek_garden_test/utilities/typography.dart';
import 'package:geek_garden_test/widgets/appbar.dart';
import 'package:geek_garden_test/widgets/modal_yes_no.dart';
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
                price: _controller.product[index].price.toString(),
                rating: _controller.product[index].rating!.rate.toString(),
                count: _controller.product[index].rating!.count.toString(),
                onTap: () {

                },
                onTapDelete: () {
                  Get.dialog(ModalYesNo(
                      title: "Hapus", message: "Anda yakin menghapus produk ini?", icon: const Icon(Icons.delete_forever, color: Colors.red,),
                      onTap: () async {
                        await _controller.postDelete(_controller.product[index].id!.toString());
                      },
                      onTapNo: () {
                        Get.back();
                      }));
                },
                onTapEdit: () {
                  var  data = {
                    'id': _controller.product[index].id!.toString(),
                    "title": _controller.product[index].title.toString(),
                    'price': _controller.product[index].price.toString(),
                    'description': _controller.product[index].description.toString(),
                    'image': _controller.product[index].image.toString(),
                    'category': _controller.product[index].category.toString()
                  };
                  Get.toNamed('/update-product', arguments: data);
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
        backgroundColor: kColorGreen,
        child: const Icon(Icons.add),
      ), //
    );
  }
}
