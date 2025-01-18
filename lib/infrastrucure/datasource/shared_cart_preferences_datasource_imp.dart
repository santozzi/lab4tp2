import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_base/domain/datasource/cart/carts_datasource.dart';
import 'package:flutter_application_base/domain/datasource/user/user_preferences_datasource.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';
import 'package:flutter_application_base/domain/entities/user/user_preferences.dart';
import 'package:flutter_application_base/infrastrucure/models/cart/carts_model.dart';
import 'package:flutter_application_base/infrastrucure/models/cart/product_cart_model.dart';
import 'package:flutter_application_base/infrastrucure/models/cart_list_preferences_model.dart';
import 'package:flutter_application_base/infrastrucure/models/user_list_preferences_model.dart';
import 'package:flutter_application_base/infrastrucure/models/user_preference_model.dart';
import 'package:flutter_application_base/mocks/carts.mock.dart';
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
      log("estoy en cartPreferencestoList: $_preferences");
      List<CartEntity> cartsPreferencesToList = _preferences.isNotEmpty
          ? CartListPreferncesModel.fromJson(jsonDecode(_preferences))
              .toCartEntityList()
          : [];

      return cartsPreferencesToList;
    } catch (e) {
      log("Error en _cartPreferencestoList: $e");
      return [];
    }

/*     _preferences = prefs.getString(cartPreferences) ?? 'carts:[]';
    log("en _cartPreferencestoList: $_preferences");
    List<dynamic> cartPreferencesToList = jsonDecode(_preferences);
    log("en _cartPreferencestoList dynamic: $cartPreferencesToList");
    List<CartEntity> cartList = [];
    for (var item in cartPreferencesToList) {
      cartList.add(CartModel.fromJson(item).toCartsEntity());
    }
    log("en _cartPreferencestoList2:$cartList");
    return cartList; */
  }

  //id del usuario
  @override
  Future<CartEntity> getCart(String id) async {
    try {
      //List<CartEntity> cartsPreferences = await _cartPreferencestoList();

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
/* 
    log("estoy en getCart");
    List<CartEntity> cartPreferences = await _cartPreferencestoList();
    log("en getCart: $cartPreferences");
    CartEntity cartEntity = cartPreferences
        .firstWhere((element) => element.userId == id, orElse: () {
      CartEntity cartDefault =
          CartEntity(id: id, userId: id, date: DateTime.now(), products: []);
      addCart(cartDefault);
      return cartDefault;
    });

    return cartEntity; */
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
      //List<CartEntity> cartsPreferences = await _cartPreferencestoList();

      _carts.add(cartEntity);
      _cartPreferencesfromList();
      return cartEntity;
    } catch (e) {
      log("Error en addCart: $e");
      return CartEntity(
          id: "0", userId: "0", date: DateTime.now(), products: []);
    }
  }

  @override
  Future<List<CartEntity>> getCarts() async {
    try {
      //List<CartEntity> cartPreferences = await _cartPreferencestoList();
      await _cartPreferencestoList();
      return _carts;
    } catch (e) {
      log("Error en getCarts: $e");
      return [];
    }
  }

  @override
  Future<void> addCartProduct(
      String id, ProductCartEntity productCartEntity) async {
    try {
      CartEntity cart = await getCart(id);

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
