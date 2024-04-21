import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import '/user_components/user_account/user_account_widget.dart';
import 'my_order_widget.dart' show MyOrderWidget;
import 'package:flutter/material.dart';

class MyOrderModel extends FlutterFlowModel<MyOrderWidget> {
  ///  Local state fields for this page.

  List<OrderRecord> filterOrder = [];
  void addToFilterOrder(OrderRecord item) => filterOrder.add(item);
  void removeFromFilterOrder(OrderRecord item) => filterOrder.remove(item);
  void removeAtIndexFromFilterOrder(int index) => filterOrder.removeAt(index);
  void insertAtIndexInFilterOrder(int index, OrderRecord item) =>
      filterOrder.insert(index, item);
  void updateFilterOrderAtIndex(int index, Function(OrderRecord) updateFn) =>
      filterOrder[index] = updateFn(filterOrder[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in my_Order widget.
  List<OrderRecord>? emptyOrder;
  // Model for hearder component.
  late HearderModel hearderModel;
  // Model for userAccount component.
  late UserAccountModel userAccountModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderTextController;
  String? Function(BuildContext, String?)? searchorderTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<OrderRecord>? searchOrder;
  List<OrderRecord> simpleSearchResults = [];
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
    userAccountModel = createModel(context, () => UserAccountModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hearderModel.dispose();
    userAccountModel.dispose();
    searchorderFocusNode?.dispose();
    searchorderTextController?.dispose();

    footerModel.dispose();
  }
}
