import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/utils/app_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/app_layout.dart';
import '../../../utils/app_style.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  String category = 'Mobiles';

  List<File> images = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    productNameController.dispose();
    productDescriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Applicances',
    'Books',
    'Fashion'
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: productDescriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: category,
          images: images);
    }
  }

  final _addProductFormKey = GlobalKey<FormState>();

  void selectImages() async {
    var res = await pickImages();

    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: Styles.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add Product',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            child: Column(
              children: [
                Gap(AppLayout.getHeight(20)),
                images.isEmpty
                    ? GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          radius: Radius.circular(AppLayout.getWidth(10)),
                          borderType: BorderType.RRect,
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: AppLayout.getHeight(150),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppLayout.getWidth(10)),
                                color: Colors.grey[200]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: AppLayout.getWidth(40),
                                ),
                                Gap(AppLayout.getHeight(10)),
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(
                                      fontSize: AppLayout.getWidth(15),
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                              builder: (BuildContext) => Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                    height: AppLayout.getHeight(200),
                                  ));
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: AppLayout.getHeight(200),
                        ),
                      ),
                Gap(AppLayout.getHeight(30)),
                CustomTextField(
                  controller: productNameController,
                  hintText: 'Product name',
                ),
                Gap(AppLayout.getHeight(10)),
                CustomTextField(
                  controller: productDescriptionController,
                  hintText: 'Product description',
                  maxLines: 7,
                ),
                Gap(AppLayout.getHeight(10)),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                ),
                Gap(AppLayout.getHeight(10)),
                CustomTextField(
                  controller: quantityController,
                  hintText: 'Quantity',
                ),
                Gap(AppLayout.getHeight(10)),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        category = newValue!;
                      });
                    },
                  ),
                ),
                Gap(AppLayout.getHeight(10)),
                CustomButton(text: 'Sell', onPressed: sellProduct),
                Gap(AppLayout.getHeight(10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
