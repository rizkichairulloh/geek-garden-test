import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:geek_garden_test/controller/add_product_controller.dart';
import 'package:geek_garden_test/utilities/constants.dart';
import 'package:geek_garden_test/utilities/typography.dart';
import 'package:geek_garden_test/widgets/appbar.dart';
import 'package:geek_garden_test/widgets/form_input.dart';
import 'package:geek_garden_test/widgets/primary_button.dart';
import 'package:geek_garden_test/widgets/widget_button.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final AddProductController _controller = Get.put(AddProductController());
  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    _controller.title.value.clear();
    _controller.category.value.clear();
    _controller.image.value.clear();
    _controller.description.value.clear();
    _controller.price.value.clear();
    super.initState();
  }

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
        child: Form(
          key: _controller.keyForm,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => formInput("Nama Produk",
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
                ),),
                const SizedBox(height: 10,),
                formDropdownButton("Kategori",
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Pilih Kategori',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme
                              .of(context)
                              .hintColor,
                        ),
                      ),
                      items: _controller.listCategory
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                          _controller.category.value = value as TextEditingController;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 140,
                      itemHeight: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Obx(() => formCurrency("Harga",
                  controller: _controller.price.value,
                  hint: "Masukkan harga produk",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong";
                    }
                    return null;
                  },
                ),),
                const SizedBox(height: 10,),
                Obx(() => formInput("Gambar",
                  hint: "Masukkan link gambar produk",
                  controller: _controller.image.value,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Gambar produk tidak boleh kosong";
                    }
                    return null;
                  },
                ),),
                const SizedBox(height: 10,),
                Obx(() => formArea("Deskripsi",
                  hint: "Masukkan diskripsi produk",
                  controller: _controller.description.value,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi produk tidak boleh kosong";
                    }
                    return null;
                  },
                ),),
                const SizedBox(height: 36,),
                SizedBox(
                    width: Get.width,
                    height: 50,
                    child: Obx(() => _controller.isLoading.value != true ? buttonSky(
                        "Tambah",
                        onPressed: () {
                          if(_controller.keyForm.currentState!.validate()) {
                            _controller.postProduct();
                          }
                        }
                    ) : buttonSkyLoading())
                )
              ],
            ),
          )
        )
      ),
    );
  }
}

