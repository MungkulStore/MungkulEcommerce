import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
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
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().phoneNoSent == true) {
        setState(() {
          _model.created = true;
        });
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController();
    _model.phoneFocusNode ??= FocusNode();

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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 1537.0,
                maxHeight: 960.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
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
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7yjjzr01' /* Sign Up */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/dl.beatsnoop_1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  constraints: const BoxConstraints(
                                                    maxWidth: 500.0,
                                                  ),
                                                  decoration: const BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        24.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'co8k5t5b' /* Create an Account */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      24.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'vekh4zhl' /* Let's get started by filling o... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Visibility(
                                                          visible: FFAppState()
                                                                  .phoneNoSent ==
                                                              false,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              TextFormField(
                                                                controller: _model
                                                                    .textController1,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.textController1',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'vh507g6s' /* Enter Your Name Here */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x7B39D2C0),
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .textController1Validator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                              TextFormField(
                                                                controller: _model
                                                                    .emailTextController,
                                                                focusNode: _model
                                                                    .emailFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.emailTextController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '5973rhd7' /* Enter Your Email Here(Optional... */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x7B39D2C0),
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .emailTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                              TextFormField(
                                                                controller: _model
                                                                    .phoneTextController,
                                                                focusNode: _model
                                                                    .phoneFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.phoneTextController',
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '4d84nzgv' /* Phone */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x7B39D2C0),
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  errorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          3.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                validator: _model
                                                                    .phoneTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        FFButtonWidget(
                                                                          onPressed: ((_model.textController1.text == '') || (_model.phoneTextController.text == ''))
                                                                              ? null
                                                                              : () async {
                                                                                  setState(() {
                                                                                    FFAppState().phoneNoSent = true;
                                                                                  });
                                                                                  final phoneNumberVal = '+855${_model.phoneTextController.text}';
                                                                                  if (phoneNumberVal.isEmpty || !phoneNumberVal.startsWith('+')) {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      const SnackBar(
                                                                                        content: Text('Phone Number is required and has to start with +.'),
                                                                                      ),
                                                                                    );
                                                                                    return;
                                                                                  }
                                                                                  await authManager.beginPhoneAuth(
                                                                                    context: context,
                                                                                    phoneNumber: phoneNumberVal,
                                                                                    onCodeSent: (context) async {
                                                                                      context.goNamedAuth(
                                                                                        'Sign_up',
                                                                                        context.mounted,
                                                                                        ignoreRedirect: true,
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '8pndq8u3' /* Create Account */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                65.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Colors.white,
                                                                                  fontSize: 21.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            disabledColor:
                                                                                const Color(0xFFA3A3A3),
                                                                            hoverColor:
                                                                                const Color(0xFF0B0001),
                                                                            hoverBorderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 1.0,
                                                                            ),
                                                                            hoverTextColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            GoRouter.of(context).prepareAuthEvent();
                                                                            final user =
                                                                                await authManager.signInWithGoogle(context);
                                                                            if (user ==
                                                                                null) {
                                                                              return;
                                                                            }

                                                                            context.goNamedAuth('HomePage',
                                                                                context.mounted);
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'au1kjqr1' /* Sign Up with Google */,
                                                                          ),
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.google,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                29.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                65.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                const Color(0x00E2C721),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 21.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              height: 15.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 20.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Container(
                                                    width: 500.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Visibility(
                                                      visible: FFAppState()
                                                              .phoneNoSent ==
                                                          true,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'dqxdgbqw' /* OTP Code */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
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
                                                              child:
                                                                  PinCodeTextField(
                                                                autoDisposeControllers:
                                                                    false,
                                                                appContext:
                                                                    context,
                                                                length: 6,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
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
                                                                errorTextSpace:
                                                                    16.0,
                                                                showCursor:
                                                                    true,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                obscureText:
                                                                    false,
                                                                hintCharacter:
                                                                    '-',
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                pinTheme:
                                                                    PinTheme(
                                                                  fieldHeight:
                                                                      54.0,
                                                                  fieldWidth:
                                                                      54.0,
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
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
                                                                onChanged:
                                                                    (_) {},
                                                                onCompleted:
                                                                    (_) async {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();
                                                                  final smsCodeVal =
                                                                      _model
                                                                          .pinCodeController!
                                                                          .text;
                                                                  if (smsCodeVal
                                                                          .isEmpty) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      const SnackBar(
                                                                        content:
                                                                            Text('Enter SMS verification code.'),
                                                                      ),
                                                                    );
                                                                    return;
                                                                  }
                                                                  final phoneVerifiedUser =
                                                                      await authManager
                                                                          .verifySmsCode(
                                                                    context:
                                                                        context,
                                                                    smsCode:
                                                                        smsCodeVal,
                                                                  );
                                                                  if (phoneVerifiedUser ==
                                                                      null) {
                                                                    return;
                                                                  }

                                                                  await currentUserReference!
                                                                      .update(
                                                                          createUsersRecordData(
                                                                    displayName:
                                                                        _model
                                                                            .textController1
                                                                            .text,
                                                                    userRef:
                                                                        currentUserReference,
                                                                    email: _model
                                                                        .emailTextController
                                                                        .text,
                                                                  ));

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
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        40.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (_model
                                                                            .resendCode ==
                                                                        false) {
                                                                      return Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.resendCode = true;
                                                                            });
                                                                            _model.timerController.onStartTimer();
                                                                            final phoneNumberVal =
                                                                                _model.phoneTextController.text;
                                                                            if (phoneNumberVal.isEmpty ||
                                                                                !phoneNumberVal.startsWith('+')) {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                const SnackBar(
                                                                                  content: Text('Phone Number is required and has to start with +.'),
                                                                                ),
                                                                              );
                                                                              return;
                                                                            }
                                                                            await authManager.beginPhoneAuth(
                                                                              context: context,
                                                                              phoneNumber: phoneNumberVal,
                                                                              onCodeSent: (context) async {
                                                                                context.goNamedAuth(
                                                                                  'Sign_up',
                                                                                  context.mounted,
                                                                                  ignoreRedirect: true,
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'w6kvh9tk' /* Resend Code */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return FlutterFlowTimer(
                                                                        initialTime:
                                                                            _model.timerInitialTimeMs,
                                                                        getDisplayTime:
                                                                            (value) =>
                                                                                StopWatchTimer.getDisplayTime(
                                                                          value,
                                                                          hours:
                                                                              false,
                                                                          milliSecond:
                                                                              false,
                                                                        ),
                                                                        controller:
                                                                            _model.timerController,
                                                                        updateStateInterval:
                                                                            const Duration(milliseconds: 1000),
                                                                        onChanged: (value,
                                                                            displayTime,
                                                                            shouldUpdate) {
                                                                          _model.timerMilliseconds =
                                                                              value;
                                                                          _model.timerValue =
                                                                              displayTime;
                                                                          if (shouldUpdate) {
                                                                            setState(() {});
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
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'columnOnPageLoadAnimation']!),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qht21gp9' /* Already Have account?  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed('Log_in');
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'k2cqra3n' /* Log In */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 77.0)),
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation']!),
                          ],
                        ),
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
        ),
      ),
    );
  }
}
