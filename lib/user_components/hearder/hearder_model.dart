import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hearder_widget.dart' show HearderWidget;
import 'package:flutter/material.dart';

class HearderModel extends FlutterFlowModel<HearderWidget> {
  ///  Local state fields for this component.

  List<CategoriesRecord> listCategory = [];
  void addToListCategory(CategoriesRecord item) => listCategory.add(item);
  void removeFromListCategory(CategoriesRecord item) =>
      listCategory.remove(item);
  void removeAtIndexFromListCategory(int index) => listCategory.removeAt(index);
  void insertAtIndexInListCategory(int index, CategoriesRecord item) =>
      listCategory.insert(index, item);
  void updateListCategoryAtIndex(
          int index, Function(CategoriesRecord) updateFn) =>
      listCategory[index] = updateFn(listCategory[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in hearder widget.
  List<CategoriesRecord>? nameCategory;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
