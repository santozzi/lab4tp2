import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_base/domain/datasource/cart/carts_datasource.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';
import 'package:flutter_application_base/infrastructure/models/cart/carts_model.dart';
import 'package:flutter_application_base/infrastructure/models/cart/product_cart_model.dart';
import 'package:flutter_application_base/infrastructure/models/cart_list_preferences_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedCartPreferencesDatasourceImp extends CartsDatasource {
  static final SharedCartPreferencesDatasourceImp _instance =
      SharedCartPreferencesDatasourceImp._internal();

  static String _preferences = 'carts:[]';
  late List<CartEntity> _carts;
  final String cartPreferences = 'cartPreferences';

  SharedCartPreferencesDatasourceImp._internal() {
    _cartPreferencestoList().then((value) => _carts = value);
  }

  factory SharedCartPreferencesDatasourceImp() {
    return _instance;
  }
  //string a json y json a List<CartEntity>
  Future<List<CartEntity>> _cartPreferencestoList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _preferences = prefs.getString(cartPreferences) ?? '{"carts":[]}';

      List<CartEntity> cartsPreferencesToList = _preferences.isNotEmpty
          ? CartListPreferncesModel.fromJson(jsonDecode(_preferences))
              .toCartEntityList()
          : [];

      return cartsPreferencesToList;
    } catch (e) {
      log("Error en _cartPreferencestoList: $e");
      return [];
    }
  }

  //id del usuario
  @override
  Future<CartEntity> getCart(String id) async {
    try {
      // _carts = await _cartPreferencestoList();
      CartEntity cartEntity =
          _carts.firstWhere((element) => element.userId == id, orElse: () {
        CartEntity preferenceDefault =
            CartEntity(id: id, userId: id, date: DateTime.now(), products: []);
        addCart(preferenceDefault);
        return preferenceDefault;
      });

      return cartEntity;
    } catch (e) {
      log("Error en getCart: $e");
      return CartEntity(
          id: "0", userId: "0", date: DateTime.now(), products: []);
    }
  }

  Future<void> _cartPreferencesfromList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(
          cartPreferences,
          jsonEncode(CartListPreferncesModel(
                  cartPreferenceModel: _carts
                      .map((e) => CartModel(
                            id: e.id,
                            userId: e.userId,
                            date: e.date,
                            products: e.products
                                .map((e) => ProductCartModel(
                                      productId: e.productId,
                                      quantity: e.quantity,
                                    ))
                                .toList(),
                          ))
                      .toList())
              .toJson()));
    } catch (e) {
      log("Error en _cartPreferencesfromList: $e");
    }
  }

  @override
  Future<CartEntity> addCart(CartEntity cartEntity) async {
    try {
      _carts.add(cartEntity);
      _cartPreferencesfromList();
      return cartEntity;
    } catch (e) {
      log("Error en addCart: $e");
      return CartEntity(
          id: "0", userId: "0", date: DateTime.now(), products: []);
    }
  }

  //solo de prueba

  Future<List<CartEntity>> getCarts() async {
    try {
      await _cartPreferencestoList();
      return _carts;
    } catch (e) {
      log("Error en getCarts: $e");
      return [];
    }
  }

  @override
  Future<void> addCartProduct(
      String idCart, ProductCartEntity productCartEntity) async {
    try {
      CartEntity cart = await getCart(idCart);
      List<ProductCartEntity> products = cart.products;
      ProductCartEntity product = products.firstWhere(
          (producto) => producto.productId == productCartEntity.productId,
          orElse: () {
        return ProductCartEntity(productId: "0", quantity: 0);
      });

      if (product.productId == "0") {
        products.add(productCartEntity);
      } else {
        product.quantity = product.quantity + productCartEntity.quantity;
      }

      await _cartPreferencesfromList();
    } catch (e) {
      log("error en addcartproduct2 ${e.toString()}");
    }
  }

  @override
  Future<void> deleteCart(String id) async {
    _preferences = '[]';
    _carts = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(cartPreferences, _preferences);
  }

  @override
  Future<void> deleteItem(String id) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}
