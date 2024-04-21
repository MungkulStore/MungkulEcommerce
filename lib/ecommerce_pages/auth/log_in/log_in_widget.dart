import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'log_in_model.dart';
export 'log_in_model.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget>
    with TickerProviderStateMixin {
  late LogInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogInModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().phoneNoSent == true) {
        setState(() {
          _model.isSent = true;
        });
      } else {
        setState(() {
          _model.isSent = false;
        });
      }
    });

    _model.phoneNoTextController ??= TextEditingController();
    _model.phoneNoFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    authManager.handlePhoneAuthStateChanges(context);
    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 60.0),
            end: const Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-0.349, 0),
            end: const Offset(0, 0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.hearderModel,
                  updateCallback: () => setState(() {}),
                  child: const HearderWidget(
                    inProductPage: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(50.0, 15.0, 50.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/dl.beatsnoop_1.png',
                                height: 496.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      maxWidth: 500.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3xfvk4pz' /* Log In */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .displaySmall
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 24.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mencmheo' /* Let's get started by filling o... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Kantumruy Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (_model.isSent == false)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    3.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 64.0,
                                                          height: 60.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        9.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'lmtifhvp' /* +855 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Kantumruy Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 398.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: SizedBox(
                                                            width: 300.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .phoneNoTextController,
                                                              focusNode: _model
                                                                  .phoneNoFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.phoneNoTextController',
                                                                const Duration(
                                                                    milliseconds:
                                                                        100),
                                                                () => setState(
                                                                    () {}),
                                                              ),
                                                              autofocus: true,
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .telephoneNumberNational
                                                              ],
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: false,
                                                                labelText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  '9mu558yh' /* Phone number */,
                                                                ),
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Kantumruy Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                errorStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Kantumruy Pro',
                                                                      color: const Color(
                                                                          0xFF0B0001),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFE0E3E7),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            9.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            9.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            9.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            9.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFF03842),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            9.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            9.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0xFFF03842),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            9.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            9.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            24.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Kantumruy Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator: _model
                                                                  .phoneNoTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 4.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        icon: Icon(
                                                          Icons.send_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .phoneNoSent =
                                                                true;
                                                          });
                                                          final phoneNumberVal =
                                                              '+855${_model.phoneNoTextController.text}';
                                                          if (phoneNumberVal
                                                                  .isEmpty ||
                                                              !phoneNumberVal
                                                                  .startsWith(
                                                                      '+')) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    'Phone Number is required and has to start with +.'),
                                                              ),
                                                            );
                                                            return;
                                                          }
                                                          await authManager
                                                              .beginPhoneAuth(
                                                            context: context,
                                                            phoneNumber:
                                                                phoneNumberVal,
                                                            onCodeSent:
                                                                (context) async {
                                                              context
                                                                  .goNamedAuth(
                                                                'Log_in',
                                                                context.mounted,
                                                                ignoreRedirect:
                                                                    true,
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                if (_model.isSent == true)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'uikjn24d' /* OTP Code */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: PinCodeTextField(
                                                          autoDisposeControllers:
                                                              false,
                                                          appContext: context,
                                                          length: 6,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Kantumruy Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          enableActiveFill:
                                                              false,
                                                          autoFocus: true,
                                                          enablePinAutofill:
                                                              false,
                                                          errorTextSpace: 16.0,
                                                          showCursor: true,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          obscureText: false,
                                                          hintCharacter: '-',
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          pinTheme: PinTheme(
                                                            fieldHeight: 54.0,
                                                            fieldWidth: 54.0,
                                                            borderWidth: 2.0,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      12.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          12.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      12.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      12.0),
                                                            ),
                                                            shape:
                                                                PinCodeFieldShape
                                                                    .box,
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            inactiveColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            selectedColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            activeFillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            inactiveFillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            selectedFillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                          controller: _model
                                                              .pinCodeController,
                                                          onChanged: (_) {},
                                                          onCompleted:
                                                              (_) async {
                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();
                                                            final smsCodeVal =
                                                                _model
                                                                    .pinCodeController!
                                                                    .text;
                                                            if (smsCodeVal
                                                                    .isEmpty) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                const SnackBar(
                                                                  content: Text(
                                                                      'Enter SMS verification code.'),
                                                                ),
                                                              );
                                                              return;
                                                            }
                                                            final phoneVerifiedUser =
                                                                await authManager
                                                                    .verifySmsCode(
                                                              context: context,
                                                              smsCode:
                                                                  smsCodeVal,
                                                            );
                                                            if (phoneVerifiedUser ==
                                                                null) {
                                                              return;
                                                            }

                                                            context.goNamedAuth(
                                                                'HomePage',
                                                                context
                                                                    .mounted);
                                                          },
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          validator: _model
                                                              .pinCodeControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      40.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              if (_model
                                                                      .resendCode ==
                                                                  false) {
                                                                return Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          1.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.resendCode =
                                                                            true;
                                                                      });
                                                                      _model
                                                                          .timerController
                                                                          .onStartTimer();
                                                                      final phoneNumberVal = _model
                                                                          .phoneNoTextController
                                                                          .text;
                                                                      if (phoneNumberVal
                                                                              .isEmpty ||
                                                                          !phoneNumberVal
                                                                              .startsWith('+')) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          const SnackBar(
                                                                            content:
                                                                                Text('Phone Number is required and has to start with +.'),
                                                                          ),
                                                                        );
                                                                        return;
                                                                      }
                                                                      await authManager
                                                                          .beginPhoneAuth(
                                                                        context:
                                                                            context,
                                                                        phoneNumber:
                                                                            phoneNumberVal,
                                                                        onCodeSent:
                                                                            (context) async {
                                                                          context
                                                                              .goNamedAuth(
                                                                            'Log_in',
                                                                            context.mounted,
                                                                            ignoreRedirect:
                                                                                true,
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'hfn2nhj5' /* Resend Code */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Kantumruy Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return FlutterFlowTimer(
                                                                  initialTime:
                                                                      _model
                                                                          .timerMilliseconds,
                                                                  getDisplayTime:
                                                                      (value) =>
                                                                          StopWatchTimer
                                                                              .getDisplayTime(
                                                                    value,
                                                                    hours:
                                                                        false,
                                                                    milliSecond:
                                                                        false,
                                                                  ),
                                                                  controller: _model
                                                                      .timerController,
                                                                  updateStateInterval:
                                                                      const Duration(
                                                                          milliseconds:
                                                                              1000),
                                                                  onChanged: (value,
                                                                      displayTime,
                                                                      shouldUpdate) {
                                                                    _model.timerMilliseconds =
                                                                        value;
                                                                    _model.timerValue =
                                                                        displayTime;
                                                                    if (shouldUpdate) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  onEnded:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.resendCode =
                                                                          false;
                                                                    });
                                                                    _model
                                                                        .timerController
                                                                        .onResetTimer();
                                                                  },
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Kantumruy Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(const SizedBox(height: 20.0)),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation']!),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              final user = await authManager
                                                  .signInWithGoogle(context);
                                              if (user == null) {
                                                return;
                                              }

                                              context.goNamedAuth(
                                                  'HomePage', context.mounted);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '0e0ujw0j' /* Google */,
                                            ),
                                            icon: const FaIcon(
                                              FontAwesomeIcons.google,
                                              size: 29.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 65.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Kantumruy Pro',
                                                        color: Colors.white,
                                                        fontSize: 21.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ntknrcgm' /* Haven't had account?  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Kantumruy Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context
                                                        .pushNamed('Sign_up');
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'w3chsp6f' /* Sign Up */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Kantumruy Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 20.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 77.0)),
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.footerModel,
                  updateCallback: () => setState(() {}),
                  child: const FooterWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
