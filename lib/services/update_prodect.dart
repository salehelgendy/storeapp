import 'package:store_app/helper/api.dart';
import 'package:store_app/models/prodect_model.dart';

class UpdateProdectService {
  Future<ProdectModel> updateProdect({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required int id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id', // تعديل URL هنا
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProdectModel.fromJson(data);
  }
}
