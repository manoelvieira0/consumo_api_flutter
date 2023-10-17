import 'package:consumo_api_flutter/app/data/http/http_client.dart';
import 'package:consumo_api_flutter/app/data/repositories/produto_repository.dart';
import 'package:consumo_api_flutter/app/pages/home/stores/product_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductStore store = ProductStore(
      repository: ProdutocRepository(
    client: HttpClient(),
  ));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Consumo de APIs',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
