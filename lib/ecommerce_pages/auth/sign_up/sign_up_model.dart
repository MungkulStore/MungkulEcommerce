import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  bool created = false;

  bool? resendCode = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

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

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    pinCodeController?.dispose();
    timerController.dispose();
    footerModel.dispose();
  }
}
