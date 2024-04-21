import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'product_detail_widget.dart' show ProductDetailWidget;
import 'package:flutter/material.dart';

class ProductDetailModel extends FlutterFlowModel<ProductDetailWidget> {
  ///  Local state fields for this page.

  ProductStruct? currentProduct;
  void updateCurrentProductStruct(Function(ProductStruct) updateFn) =>
      updateFn(currentProduct ??= ProductStruct());

  CheckoutProductStruct? checkoutProduct;
  void updateCheckoutProductStruct(Function(CheckoutProductStruct) updateFn) =>
      updateFn(checkoutProduct ??= CheckoutProductStruct());

  int itemIndex = 0;

  String imageView = 'true';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in product_Detail widget.
  ProductsRecord? productOutput;
  // Model for hearder component.
  late HearderModel hearderModel;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hearderModel.dispose();
    footerModel.dispose();
  }
}
