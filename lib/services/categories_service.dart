import 'package:store_app/helper/api.dart';
import 'package:store_app/models/prodect_model.dart';

class CategoriesService {
  Future<List<ProdectModel>> getAllProdects(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products/category/$categoryName',
        );
    List<ProdectModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProdectModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
