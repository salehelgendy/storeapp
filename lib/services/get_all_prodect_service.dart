import 'package:store_app/helper/api.dart';
import 'package:store_app/models/prodect_model.dart';

class AllProdectService {
  Future<List<ProdectModel>> getAllProdects() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products',);
    print('Received data: $data');

    List<ProdectModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProdectModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
