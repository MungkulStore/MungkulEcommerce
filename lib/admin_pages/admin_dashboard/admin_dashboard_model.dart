import '/admin_components/web_nav/web_nav_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_dashboard_widget.dart' show AdminDashboardWidget;
import 'package:flutter/material.dart';

class AdminDashboardModel extends FlutterFlowModel<AdminDashboardWidget> {
  ///  Local state fields for this page.

  int listIndex = 0;

  List<BestSellingProductsStruct> bestSellingProducts = [];
  void addToBestSellingProducts(BestSellingProductsStruct item) =>
      bestSellingProducts.add(item);
  void removeFromBestSellingProducts(BestSellingProductsStruct item) =>
      bestSellingProducts.remove(item);
  void removeAtIndexFromBestSellingProducts(int index) =>
      bestSellingProducts.removeAt(index);
  void insertAtIndexInBestSellingProducts(
          int index, BestSellingProductsStruct item) =>
      bestSellingProducts.insert(index, item);
  void updateBestSellingProductsAtIndex(
          int index, Function(BestSellingProductsStruct) updateFn) =>
      bestSellingProducts[index] = updateFn(bestSellingProducts[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AdminDashboard widget.
  List<OrderRecord>? orderDocs;
  // Model for webNav component.
  late WebNavModel webNavModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
  }
}
