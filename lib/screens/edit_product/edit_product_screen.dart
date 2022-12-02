import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:geek_garden_test/controller/add_product_controller.dart';
import 'package:geek_garden_test/controller/edit_product_controller.dart';
import 'package:geek_garden_test/controller/home_controller.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:geek_garden_test/utilities/typography.dart';
import 'package:geek_garden_test/widgets/appbar.dart';
import 'package:geek_garden_test/widgets/form_input.dart';
import 'package:geek_garden_test/widgets/primary_button.dart';
import 'package:geek_garden_test/widgets/widget_button.dart';
import 'package:get/get.dart';

class EditProductScreen extends StatefulWidget {

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final EditProductController _controller = Get.put(EditProductController());
  final HomeController _controllerHome = Get.put(HomeController());
  String? selectedValue;
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    id = Get.arguments['id'];
    _controller.selectedValue = Get.arguments['category'];
    _controller.title.value.text = Get.arguments['title'];
    _controller.price.value.text = Get.arguments['price'];
    _controller.image.value.text = Get.arguments['image'];
    _controller.description.value.text = Get.arguments['description'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Produk",
          style: kTextHeader3Bold.copyWith(color: kColorWhite),
        ),
        backgroundColor: kColorGreen,
      ),
      body: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Form(
              key: _controller.keyFormEdit,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => formInput(
                        "Nama Produk",
                        hint: "Masukkan nama produk",
                        controller: _controller.title.value,
                        keyboardType: TextInputType.text,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama Produk tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => formDropdownButton(
                      "Kategori",
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            'Pilih Kategori',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: _controllerHome.listCategory
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          value: _controller.selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _controller.selectedValue = value as String;
                              _controller.category.value.text =
                                  value;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 140,
                          itemHeight: 40,
                        ),
                      ),
                    ),),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => formCurrency(
                        "Harga",
                        controller: _controller.price.value,
                        hint: "Masukkan harga produk",
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Harga tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => formInput(
                        "Gambar",
                        hint: "Masukkan link gambar produk",
                        controller: _controller.image.value,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Gambar produk tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => formArea(
                        "Deskripsi",
                        hint: "Masukkan diskripsi produk",
                        controller: _controller.description.value,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Deskripsi produk tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    SizedBox(
                        width: Get.width,
                        height: 50,
                        child: Obx(() => _controller.isLoading.value != true
                            ? buttonSky("Edit", onPressed: () {
                                if (_controller.keyFormEdit.currentState!
                                    .validate()) {
                                  _controller.postProduct(id!);
                                }
                              })
                            : buttonSkyLoading()))
                  ],
                ),
              ))),
    );
  }
}
