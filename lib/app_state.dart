import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_guestInfo')) {
        try {
          final serializedData = prefs.getString('ff_guestInfo') ?? '{}';
          _guestInfo =
              GuestStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _sum = 0.0;
  double get sum => _sum;
  set sum(double value) {
    _sum = value;
  }

  double _discountAmount = 0.0;
  double get discountAmount => _discountAmount;
  set discountAmount(double value) {
    _discountAmount = value;
  }

  double _subTotal = 0.0;
  double get subTotal => _subTotal;
  set subTotal(double value) {
    _subTotal = value;
  }

  List<CheckoutProductStruct> _checkoutCart = [];
  List<CheckoutProductStruct> get checkoutCart => _checkoutCart;
  set checkoutCart(List<CheckoutProductStruct> value) {
    _checkoutCart = value;
  }

  void addToCheckoutCart(CheckoutProductStruct value) {
    _checkoutCart.add(value);
  }

  void removeFromCheckoutCart(CheckoutProductStruct value) {
    _checkoutCart.remove(value);
  }

  void removeAtIndexFromCheckoutCart(int index) {
    _checkoutCart.removeAt(index);
  }

  void updateCheckoutCartAtIndex(
    int index,
    CheckoutProductStruct Function(CheckoutProductStruct) updateFn,
  ) {
    _checkoutCart[index] = updateFn(_checkoutCart[index]);
  }

  void insertAtIndexInCheckoutCart(int index, CheckoutProductStruct value) {
    _checkoutCart.insert(index, value);
  }

  GuestStruct _guestInfo = GuestStruct.fromSerializableMap(jsonDecode('{}'));
  GuestStruct get guestInfo => _guestInfo;
  set guestInfo(GuestStruct value) {
    _guestInfo = value;
    prefs.setString('ff_guestInfo', value.serialize());
  }

  void updateGuestInfoStruct(Function(GuestStruct) updateFn) {
    updateFn(_guestInfo);
    prefs.setString('ff_guestInfo', _guestInfo.serialize());
  }

  bool _phoneNoSent = false;
  bool get phoneNoSent => _phoneNoSent;
  set phoneNoSent(bool value) {
    _phoneNoSent = value;
  }

  List<DocumentReference> _searchResult = [];
  List<DocumentReference> get searchResult => _searchResult;
  set searchResult(List<DocumentReference> value) {
    _searchResult = value;
  }

  void addToSearchResult(DocumentReference value) {
    _searchResult.add(value);
  }

  void removeFromSearchResult(DocumentReference value) {
    _searchResult.remove(value);
  }

  void removeAtIndexFromSearchResult(int index) {
    _searchResult.removeAt(index);
  }

  void updateSearchResultAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _searchResult[index] = updateFn(_searchResult[index]);
  }

  void insertAtIndexInSearchResult(int index, DocumentReference value) {
    _searchResult.insert(index, value);
  }

  double _totalRevenue = 0.0;
  double get totalRevenue => _totalRevenue;
  set totalRevenue(double value) {
    _totalRevenue = value;
  }

  List<DocumentReference> _CompareProduct = [];
  List<DocumentReference> get CompareProduct => _CompareProduct;
  set CompareProduct(List<DocumentReference> value) {
    _CompareProduct = value;
  }

  void addToCompareProduct(DocumentReference value) {
    _CompareProduct.add(value);
  }

  void removeFromCompareProduct(DocumentReference value) {
    _CompareProduct.remove(value);
  }

  void removeAtIndexFromCompareProduct(int index) {
    _CompareProduct.removeAt(index);
  }

  void updateCompareProductAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _CompareProduct[index] = updateFn(_CompareProduct[index]);
  }

  void insertAtIndexInCompareProduct(int index, DocumentReference value) {
    _CompareProduct.insert(index, value);
  }

  List<String> _compareProducts = [];
  List<String> get compareProducts => _compareProducts;
  set compareProducts(List<String> value) {
    _compareProducts = value;
  }

  void addToCompareProducts(String value) {
    _compareProducts.add(value);
  }

  void removeFromCompareProducts(String value) {
    _compareProducts.remove(value);
  }

  void removeAtIndexFromCompareProducts(int index) {
    _compareProducts.removeAt(index);
  }

  void updateCompareProductsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _compareProducts[index] = updateFn(_compareProducts[index]);
  }

  void insertAtIndexInCompareProducts(int index, String value) {
    _compareProducts.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
