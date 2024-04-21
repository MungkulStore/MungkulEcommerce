import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_card_widget.dart' show ProductCardWidget;
import 'package:flutter/material.dart';

class ProductCardModel extends FlutterFlowModel<ProductCardWidget> {
  ///  Local state fields for this component.

  ProductStruct? currentProduct;
  void updateCurrentProductStruct(Function(ProductStruct) updateFn) =>
      updateFn(currentProduct ??= ProductStruct());

  CheckoutProductStruct? checkoutProduct;
  void updateCheckoutProductStruct(Function(CheckoutProductStruct) updateFn) =>
      updateFn(checkoutProduct ??= CheckoutProductStruct());

  int itemIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
