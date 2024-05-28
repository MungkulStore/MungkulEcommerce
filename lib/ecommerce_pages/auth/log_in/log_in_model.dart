import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'log_in_widget.dart' show LogInWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class LogInModel extends FlutterFlowModel<LogInWidget> {
  ///  Local state fields for this page.

  bool isSent = false;

  bool resendCode = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for phoneNo widget.
  FocusNode? phoneNoFocusNode;
  TextEditingController? phoneNoTextController;
  String? Function(BuildContext, String?)? phoneNoTextControllerValidator;
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
    phoneNoFocusNode?.dispose();
    phoneNoTextController?.dispose();

    pinCodeController?.dispose();
    timerController.dispose();
    footerModel.dispose();
  }
}
