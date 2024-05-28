import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'compare_products_widget.dart' show CompareProductsWidget;
import 'package:flutter/material.dart';

class CompareProductsModel extends FlutterFlowModel<CompareProductsWidget> {
  ///  Local state fields for this page.

  List<ProductsRecord> product = [];
  void addToProduct(ProductsRecord item) => product.add(item);
  void removeFromProduct(ProductsRecord item) => product.remove(item);
  void removeAtIndexFromProduct(int index) => product.removeAt(index);
  void insertAtIndexInProduct(int index, ProductsRecord item) =>
      product.insert(index, item);
  void updateProductAtIndex(int index, Function(ProductsRecord) updateFn) =>
      product[index] = updateFn(product[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Compare_products widget.
  List<ProductsRecord>? listofProducts;
  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ProductsRecord>();

  @override
  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hearderModel.dispose();
  }
}
