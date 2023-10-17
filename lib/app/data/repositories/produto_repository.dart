import 'dart:convert';

import 'package:consumo_api_flutter/app/data/http/exceptions.dart';
import 'package:consumo_api_flutter/app/data/http/http_client.dart';
import 'package:consumo_api_flutter/app/data/models/product_model.dart';

abstract class IProdutoRepository {
  Future<List<ProductModel>> getProdutos();
}

class ProdutocRepository implements IProdutoRepository {

  final IHttpClient client;

  ProdutocRepository({required this.client});

  @override
  Future<List<ProductModel>> getProdutos() async {
    final response = await client.get(url: 'https://dummyjson.com/products');

    if (response.statusCode == 200){
      final List<ProductModel> products = []; // Criando uma lista vazia

      final body = jsonDecode(response.body); // Decodificando Json 

      body['products'].map((item){ // Mapeando a lista
        final ProductModel product = ProductModel.fromMap(item);
        products.add(product);
      }).toList();

      return products;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A URL Informada não é válida.");
    } else {
      throw Exception("Não foi possível carregar os produtos.");
    }
  }
  
}