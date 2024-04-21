import '/admin_components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_product_widget.dart' show NewProductWidget;
import 'package:flutter/material.dart';

class NewProductModel extends FlutterFlowModel<NewProductWidget> {
  ///  Local state fields for this page.

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  int listIndex = 0;

  String previewImage = '';

  bool newCategory = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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

  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];
  List<String> uploadedFileUrls3 = [];

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
  // State field(s) for Category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for Category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryTextController;
  String? Function(BuildContext, String?)? categoryTextControllerValidator;

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

    categoryFocusNode?.dispose();
    categoryTextController?.dispose();
  }
}
