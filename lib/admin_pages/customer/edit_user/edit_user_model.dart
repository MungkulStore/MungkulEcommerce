import '/flutter_flow/flutter_flow_util.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:flutter/material.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode1;
  TextEditingController? fullnameTextController1;
  String? Function(BuildContext, String?)? fullnameTextController1Validator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode2;
  TextEditingController? fullnameTextController2;
  String? Function(BuildContext, String?)? fullnameTextController2Validator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode3;
  TextEditingController? fullnameTextController3;
  String? Function(BuildContext, String?)? fullnameTextController3Validator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode4;
  TextEditingController? fullnameTextController4;
  String? Function(BuildContext, String?)? fullnameTextController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    fullnameFocusNode1?.dispose();
    fullnameTextController1?.dispose();

    fullnameFocusNode2?.dispose();
    fullnameTextController2?.dispose();

    fullnameFocusNode3?.dispose();
    fullnameTextController3?.dispose();

    fullnameFocusNode4?.dispose();
    fullnameTextController4?.dispose();
  }
}
