import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_popup_widget.dart' show SignUpPopupWidget;
import 'package:flutter/material.dart';

class SignUpPopupModel extends FlutterFlowModel<SignUpPopupWidget> {
  ///  Local state fields for this component.

  bool created = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    pinCodeController?.dispose();
  }
}
