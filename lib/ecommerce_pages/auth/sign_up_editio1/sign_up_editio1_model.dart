import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'sign_up_editio1_widget.dart' show SignUpEditio1Widget;
import 'package:flutter/material.dart';

class SignUpEditio1Model extends FlutterFlowModel<SignUpEditio1Widget> {
  ///  Local state fields for this page.

  bool created = false;

  bool completProfile = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for hearder component.
  late HearderModel hearderModel;
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
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
    pinCodeController = TextEditingController();
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hearderModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    pinCodeController?.dispose();
    footerModel.dispose();
  }
}
