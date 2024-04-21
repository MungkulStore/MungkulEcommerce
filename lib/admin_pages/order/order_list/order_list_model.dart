import '/admin_components/web_nav/web_nav_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'order_list_widget.dart' show OrderListWidget;
import 'package:flutter/material.dart';

class OrderListModel extends FlutterFlowModel<OrderListWidget> {
  ///  Local state fields for this page.

  List<OrderRecord> orderlist = [];
  void addToOrderlist(OrderRecord item) => orderlist.add(item);
  void removeFromOrderlist(OrderRecord item) => orderlist.remove(item);
  void removeAtIndexFromOrderlist(int index) => orderlist.removeAt(index);
  void insertAtIndexInOrderlist(int index, OrderRecord item) =>
      orderlist.insert(index, item);
  void updateOrderlistAtIndex(int index, Function(OrderRecord) updateFn) =>
      orderlist[index] = updateFn(orderlist[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Order_list widget.
  List<OrderRecord>? orderLoad;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderTextController;
  String? Function(BuildContext, String?)? searchorderTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in searchorder widget.
  List<OrderRecord>? searchOrderCopy;
  List<OrderRecord> simpleSearchResults1 = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<OrderRecord>? searchOrder;
  List<OrderRecord> simpleSearchResults2 = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<OrderRecord>? statusResult;

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
