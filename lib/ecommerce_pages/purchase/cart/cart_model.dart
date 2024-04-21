import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  bool cartEmptied = false;

  int itemIndex = 0;

  List<ProductStruct> productList = [];
  void addToProductList(ProductStruct item) => productList.add(item);
  void removeFromProductList(ProductStruct item) => productList.remove(item);
  void removeAtIndexFromProductList(int index) => productList.removeAt(index);
  void insertAtIndexInProductList(int index, ProductStruct item) =>
      productList.insert(index, item);
  void updateProductListAtIndex(int index, Function(ProductStruct) updateFn) =>
      productList[index] = updateFn(productList[index]);

  int productListIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for Checkbox_today widget.
  bool? checkboxTodayValue;
  // State field(s) for checkbox_instore widget.
  bool? checkboxInstoreValue;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    hearderModel.dispose();
    footerModel.dispose();
  }
}
