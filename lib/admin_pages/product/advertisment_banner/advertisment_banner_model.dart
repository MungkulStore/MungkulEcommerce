import '/admin_components/web_nav/web_nav_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'advertisment_banner_widget.dart' show AdvertismentBannerWidget;
import 'package:flutter/material.dart';

class AdvertismentBannerModel
    extends FlutterFlowModel<AdvertismentBannerWidget> {
  ///  Local state fields for this page.

  String? selectedProduct;

  String adImage = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for productDropdown widget.
  String? productDropdownValue;
  FormFieldController<String>? productDropdownValueController;
  // State field(s) for percentage widget.
  FocusNode? percentageFocusNode;
  TextEditingController? percentageTextController;
  String? Function(BuildContext, String?)? percentageTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductsRecord? selectedProductAd;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    percentageFocusNode?.dispose();
    percentageTextController?.dispose();
  }
}
