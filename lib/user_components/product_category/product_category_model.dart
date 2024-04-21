import '/flutter_flow/flutter_flow_util.dart';
import 'product_category_widget.dart' show ProductCategoryWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductCategoryModel extends FlutterFlowModel<ProductCategoryWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
