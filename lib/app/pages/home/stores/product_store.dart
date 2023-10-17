import 'package:consumo_api_flutter/app/data/http/exceptions.dart';
import 'package:consumo_api_flutter/app/data/models/product_model.dart';
import 'package:consumo_api_flutter/app/data/repositories/produto_repository.dart';
import 'package:flutter/material.dart';

class ProductStore {
  final IProdutoRepository repository;

  // Variável reativa para o Loading
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // Variável reativa para o state
  final ValueNotifier<List<ProductModel>> state =
      ValueNotifier<List<ProductModel>>([]);

  // Variável reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ProductStore({required this.repository});

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    }
    catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
