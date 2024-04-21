import '/admin_components/web_nav/web_nav_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_product_widget.dart' show EditProductWidget;
import 'package:flutter/material.dart';

class EditProductModel extends FlutterFlowModel<EditProductWidget> {
  ///  Local state fields for this page.

  List<String> editImageList = [];
  void addToEditImageList(String item) => editImageList.add(item);
  void removeFromEditImageList(String item) => editImageList.remove(item);
  void removeAtIndexFromEditImageList(int index) =>
      editImageList.removeAt(index);
  void insertAtIndexInEditImageList(int index, String item) =>
      editImageList.insert(index, item);
  void updateEditImageListAtIndex(int index, Function(String) updateFn) =>
      editImageList[index] = updateFn(editImageList[index]);

  ProductStruct? queriedProduct;
  void updateQueriedProductStruct(Function(ProductStruct) updateFn) =>
      updateFn(queriedProduct ??= ProductStruct());

  String? previewImg;

  int? imageIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Edit_product widget.
  ProductsRecord? productDocOutput;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for productsName widget.
  FocusNode? productsNameFocusNode;
  TextEditingController? productsNameTextController;
  String? Function(BuildContext, String?)? productsNameTextControllerValidator;
  // State field(s) for Descriptiom widget.
  FocusNode? descriptiomFocusNode;
  TextEditingController? descriptiomTextController;
  String? Function(BuildContext, String?)? descriptiomTextControllerValidator;
  // State field(s) for Aboutitem widget.
  FocusNode? aboutitemFocusNode;
  TextEditingController? aboutitemTextController;
  String? Function(BuildContext, String?)? aboutitemTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // State field(s) for basePrice widget.
  FocusNode? basePriceFocusNode;
  TextEditingController? basePriceTextController;
  String? Function(BuildContext, String?)? basePriceTextControllerValidator;
  // State field(s) for Status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;
  // State field(s) for percentage widget.
  FocusNode? percentageFocusNode;
  TextEditingController? percentageTextController;
  String? Function(BuildContext, String?)? percentageTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    productsNameFocusNode?.dispose();
    productsNameTextController?.dispose();

    descriptiomFocusNode?.dispose();
    descriptiomTextController?.dispose();

    aboutitemFocusNode?.dispose();
    aboutitemTextController?.dispose();

    basePriceFocusNode?.dispose();
    basePriceTextController?.dispose();

    percentageFocusNode?.dispose();
    percentageTextController?.dispose();
  }
}
