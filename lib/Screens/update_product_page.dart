import 'package:flutter/material.dart';
import 'package:store_app/models/prodect_model.dart';
import 'package:store_app/services/update_prodect.dart';
import 'package:store_app/widgets/CustemTextBottom.dart';
import 'package:store_app/widgets/custom_text_from_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProdectModel product =
        ModalRoute.of(context)!.settings.arguments as ProdectModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Update Product',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                labeltext: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                labeltext: 'Product Price',
                inputType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                labeltext: 'description',
                onChanged: (data) {
                  desc = data;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                labeltext: 'image',
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextBottom(
                textbottom: 'Update Product',
                onTap: () async {
                  if (productName == null ||
                      productName!.isEmpty || // تحقق من أن الحقل ليس فارغًا
                      price == null ||
                      price!.isEmpty || // تحقق من أن السعر ليس فارغًا
                      desc == null ||
                      desc!.isEmpty || // تحقق من أن الوصف ليس فارغًا
                      image == null ||
                      image!.isEmpty) {
                    // تحقق من أن الصورة ليست فارغة
                    // إذا كانت أي من الحقول فارغة، إظهار رسالة "Please fill all fields"
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all fields')),
                    );
                  } else {
                    try {
                      // تحويل السعر إلى double والتأكد من أنه ليس 0.0 إذا كانت العملية فاشلة
                      double parsedPrice = double.tryParse(price!) ?? 0.0;

                      // تنفيذ عملية التحديث
                      ProdectModel updatedProduct =
                          await UpdateProdectService().updateProdect(
                        id: product.id,
                        title: productName!,
                        price: parsedPrice
                            .toString(), // تحويل السعر إلى نص مناسب للإرسال
                        desc: desc!,
                        image: image!,
                        category: product.category,
                      );

                      // إظهار رسالة نجاح
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Product updated successfully!')),
                      );

                      // طباعة المعلومات الجديدة للمنتج للتأكد من التحديث
                      print('Updated Product Info:');
                      print('ID: ${updatedProduct.id}');
                      print('Title: ${updatedProduct.title}');
                      print('Price: ${updatedProduct.price}');
                      print('Description: ${updatedProduct.description}');
                      print('Image: ${updatedProduct.image}');
                      print('Category: ${updatedProduct.category}');
                    } catch (error) {
                      // إظهار رسالة خطأ عند الفشل
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Failed to update product: $error')),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
