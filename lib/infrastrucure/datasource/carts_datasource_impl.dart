import 'package:flutter_application_base/domain/datasource/carts_datasource.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';
import 'package:flutter_application_base/infrastrucure/models/carts_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'dart:developer';

class CartsDatasourceImpl implements CartsDatasource {

  final url = dotenv.env['URL_API'];

  @override
  Future<CartsEntity> getCart(int id) async {
    try {
      final response = await http.get(Uri.parse('$url/carts/$id'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> cartApi = jsonDecode(response.body);
        final CartsEntity cart = CartsModel.fromJson(cartApi).toCartsEntity();
        return cart;
        }
        else {
        throw Exception('Error al obtener los carritos: ${response.statusCode}');
      }
    }
    catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }

  @override
  Future<List<CartsEntity>> getCarts() async {
    try {
      final response = await http.get(Uri.parse('$url/carts'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> cartsApi = responseData['data']['data'];
        final List<CartsEntity> cartsList = cartsApi
            .map((cart) => CartsModel.fromJson(cart).toCartsEntity())
            .toList();
        return cartsList;
        }
        else {
        throw Exception('Error al obtener los carritos: ${response.statusCode}');
      }
    }
    catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }
}
