import '/flutter_flow/flutter_flow_util.dart';
import 'hearder_widget.dart' show HearderWidget;
import 'package:flutter/material.dart';

class HearderModel extends FlutterFlowModel<HearderWidget> {
  ///  State fields for stateful widgets in this component.

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
