import '/admin_components/web_nav/web_nav_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_list_widget.dart' show CustomerListWidget;
import 'package:flutter/material.dart';

class CustomerListModel extends FlutterFlowModel<CustomerListWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> customerList = [];
  void addToCustomerList(UsersRecord item) => customerList.add(item);
  void removeFromCustomerList(UsersRecord item) => customerList.remove(item);
  void removeAtIndexFromCustomerList(int index) => customerList.removeAt(index);
  void insertAtIndexInCustomerList(int index, UsersRecord item) =>
      customerList.insert(index, item);
  void updateCustomerListAtIndex(int index, Function(UsersRecord) updateFn) =>
      customerList[index] = updateFn(customerList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Customer_List widget.
  List<UsersRecord>? userOutput;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderTextController;
  String? Function(BuildContext, String?)? searchorderTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in searchorder widget.
  List<UsersRecord>? searchOrderCopy;
  List<UsersRecord> simpleSearchResults1 = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? searchOrder;
  List<UsersRecord> simpleSearchResults2 = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();

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
