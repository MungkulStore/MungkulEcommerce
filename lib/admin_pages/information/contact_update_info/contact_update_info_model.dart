import '/admin_components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_update_info_widget.dart' show ContactUpdateInfoWidget;
import 'package:flutter/material.dart';

class ContactUpdateInfoModel extends FlutterFlowModel<ContactUpdateInfoWidget> {
  ///  Local state fields for this page.

  String? visionImage;

  String? processImage;

  String? approachImage = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
  // State field(s) for fcebook widget.
  FocusNode? fcebookFocusNode;
  TextEditingController? fcebookTextController;
  String? Function(BuildContext, String?)? fcebookTextControllerValidator;
  // State field(s) for telegram widget.
  FocusNode? telegramFocusNode;
  TextEditingController? telegramTextController;
  String? Function(BuildContext, String?)? telegramTextControllerValidator;
  // State field(s) for vision widget.
  FocusNode? visionFocusNode;
  TextEditingController? visionTextController;
  String? Function(BuildContext, String?)? visionTextControllerValidator;
  // State field(s) for process widget.
  FocusNode? processFocusNode;
  TextEditingController? processTextController;
  String? Function(BuildContext, String?)? processTextControllerValidator;
  // State field(s) for approach widget.
  FocusNode? approachFocusNode;
  TextEditingController? approachTextController;
  String? Function(BuildContext, String?)? approachTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

    fcebookFocusNode?.dispose();
    fcebookTextController?.dispose();

    telegramFocusNode?.dispose();
    telegramTextController?.dispose();

    visionFocusNode?.dispose();
    visionTextController?.dispose();

    processFocusNode?.dispose();
    processTextController?.dispose();

    approachFocusNode?.dispose();
    approachTextController?.dispose();
  }
}
