import 'package:flutter/material.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:geek_garden_test/utilities/typography.dart';
import 'package:geek_garden_test/widgets/appbar.dart';
import 'package:geek_garden_test/widgets/form_input.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk", style: kTextHeader3Bold.copyWith(color: kColorWhite),),
        backgroundColor: kColorGreen,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            formInput("Nama Produk"),
            const SizedBox(height: 10,),
            formInput("Harga"),
            const SizedBox(height: 10,),
            formArea("Deskripsi"),
          ],
        ),
      ),
    );
  }
}
