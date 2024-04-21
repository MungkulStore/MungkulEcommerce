import '/admin_components/web_nav/web_nav_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'product_list_widget.dart' show ProductListWidget;
import 'package:flutter/material.dart';

class ProductListModel extends FlutterFlowModel<ProductListWidget> {
  ///  Local state fields for this page.

  List<ProductsRecord> productsList = [];
  void addToProductsList(ProductsRecord item) => productsList.add(item);
  void removeFromProductsList(ProductsRecord item) => productsList.remove(item);
  void removeAtIndexFromProductsList(int index) => productsList.removeAt(index);
  void insertAtIndexInProductsList(int index, ProductsRecord item) =>
      productsList.insert(index, item);
  void updateProductsListAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      productsList[index] = updateFn(productsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in product_list widget.
  List<ProductsRecord>? productOutput;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderTextController;
  String? Function(BuildContext, String?)? searchorderTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in searchorder widget.
  List<ProductsRecord>? searchProduct;
  List<ProductsRecord> simpleSearchResults1 = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<ProductsRecord>? searchOrder;
  List<ProductsRecord> simpleSearchResults2 = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<ProductsRecord>? ststus;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    searchorderFocusNode?.dispose();
    searchorderTextController?.dispose();
  }
}
