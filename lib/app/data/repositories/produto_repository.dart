import 'package:consumo_api_flutter/app/data/models/product_model.dart';

abstract class IProdutoRepository {
  Future<List<ProductModel>> getProdutos();
}

class ProdutocRepository implements IProdutoRepository {
  @override
  Future<List<ProductModel>> getProdutos() {
    // TODO: implement get
    throw UnimplementedError();
  }
  
}