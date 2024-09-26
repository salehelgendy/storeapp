import 'package:flutter/material.dart';
import 'package:store_app/services/get_all_prodect_service.dart';
import 'package:store_app/widgets/cart_products.dart';
import 'package:store_app/models/prodect_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print('Done');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('New Trend'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
        child: FutureBuilder<List<ProdectModel>>(
            future: AllProdectService().getAllProdects(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'), // عرض رسالة الخطأ
                );
              } else if (snapshot.hasData) {
                return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 70,
                  ),
                  itemCount: snapshot.data!.length, // تأكد من تحديد عدد العناصر
                  itemBuilder: (context, index) {
                    ProdectModel product = snapshot.data![index];
                    return CartProducts(product: product);
                  },
                );
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            }),
      ),
    );
  }
}
