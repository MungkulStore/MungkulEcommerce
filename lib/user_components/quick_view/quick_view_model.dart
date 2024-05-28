import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quick_view_widget.dart' show QuickViewWidget;
import 'package:flutter/material.dart';

class QuickViewModel extends FlutterFlowModel<QuickViewWidget> {
  ///  Local state fields for this component.

  String imageView = 'true';

  bool click = false;

  ProductStruct? currentProducts;
  void updateCurrentProductsStruct(Function(ProductStruct) updateFn) =>
      updateFn(currentProducts ??= ProductStruct());

  CheckoutProductStruct? checkoutProducts;
  void updateCheckoutProductsStruct(Function(CheckoutProductStruct) updateFn) =>
      updateFn(checkoutProducts ??= CheckoutProductStruct());

  int? index;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
