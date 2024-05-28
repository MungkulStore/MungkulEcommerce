import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/quick_view/quick_view_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    this.image,
    this.discount,
    this.name,
    this.price,
    required this.productRef,
    this.aboutItem,
    this.description,
    this.status,
    this.id,
    this.catregory,
  });

  final String? image;
  final int? discount;
  final String? name;
  final double? price;
  final DocumentReference? productRef;
  final String? aboutItem;
  final String? description;
  final String? status;
  final String? id;
  final String? catregory;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget>
    with TickerProviderStateMixin {
  late ProductCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.11,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          'product_Detail',
          queryParameters: {
            'productId': serializeParam(
              widget.id,
              ParamType.String,
            ),
            'cstegoryId': serializeParam(
              widget.catregory,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        width: 270.0,
        constraints: const BoxConstraints(
          minWidth: 270.0,
          minHeight: 350.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              onEnter: ((event) async {
                setState(() => _model.mouseRegionHovered = true);
                if (animationsMap['containerOnActionTriggerAnimation'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation']!
                      .controller
                      .forward(from: 0.0);
                }
              }),
              onExit: ((event) async {
                setState(() => _model.mouseRegionHovered = false);
                if (animationsMap['containerOnActionTriggerAnimation'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation']!
                      .controller
                      .forward()
                      .whenComplete(
                          animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .reverse);
                }
              }),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 250.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(3.0),
                    bottomRight: Radius.circular(3.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  border: Border.all(
                    color: const Color(0xFFF5F5F5),
                    width: 1.0,
                  ),
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 200.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            widget.image!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.discount! <= 0)
                                Container(
                                  width: 60.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              if (widget.discount! > 0)
                                Container(
                                  width: 60.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      '-${valueOrDefault<String>(
                                        widget.discount?.toString(),
                                        '00',
                                      )}%',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AlignedTooltip(
                                        content: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ambdfmfy' /* Compare Product */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        offset: 4.0,
                                        preferredDirection: AxisDirection.up,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        elevation: 4.0,
                                        tailBaseWidth: 5.0,
                                        tailLength: 5.0,
                                        waitDuration:
                                            const Duration(milliseconds: 10),
                                        showDuration:
                                            const Duration(milliseconds: 100),
                                        triggerMode: TooltipTriggerMode.tap,
                                        child: FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          icon: Icon(
                                            Icons.change_circle_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().addToCompareProducts(
                                                  widget.id!);
                                            });
                                            if (FFAppState()
                                                    .compareProducts
                                                    .length >=
                                                2) {
                                              context.pushNamed(
                                                  'Compare_products');
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Add Another Product to Compare',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      AlignedTooltip(
                                        content: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'c90c5mx2' /* Quick View */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        offset: 4.0,
                                        preferredDirection: AxisDirection.up,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        elevation: 4.0,
                                        tailBaseWidth: 5.0,
                                        tailLength: 5.0,
                                        waitDuration:
                                            const Duration(milliseconds: 10),
                                        showDuration:
                                            const Duration(milliseconds: 100),
                                        triggerMode: TooltipTriggerMode.tap,
                                        child: Builder(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            icon: Icon(
                                              Icons.remove_red_eye_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: QuickViewWidget(
                                                      quickView:
                                                          widget.productRef,
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (FFAppState()
                                  .checkoutCart
                                  .where((e) => e.product.id == widget.id)
                                  .toList().isEmpty) {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.updatePage(() {
                                    _model.currentProduct = null;
                                  });
                                  setState(() {
                                    _model.updateCurrentProductStruct(
                                      (e) => e
                                        ..name = widget.name
                                        ..discount = widget.discount
                                        ..description = widget.description
                                        ..aboutItem = widget.aboutItem
                                        ..status = widget.status
                                        ..category = widget.catregory
                                        ..image = widget.image
                                        ..id = widget.id
                                        ..productRef = widget.productRef
                                        ..price = (widget.price!) -
                                            ((widget.price!) *
                                                widget.discount!.toDouble() /
                                                100)
                                        ..basePrice = widget.price,
                                    );
                                  });
                                  _model.updatePage(() {
                                    _model.updateCheckoutProductStruct(
                                      (e) => e
                                        ..product = _model.currentProduct
                                        ..incrementQuantity(1)
                                        ..totalPrice =
                                            _model.currentProduct?.price,
                                    );
                                  });
                                  FFAppState().update(() {
                                    FFAppState().sum = FFAppState().sum +
                                        _model.currentProduct!.price;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().discountAmount =
                                        FFAppState().discountAmount +
                                            ((widget.price!) *
                                                (widget.discount!) /
                                                100);
                                  });
                                  FFAppState().update(() {
                                    FFAppState().subTotal =
                                        FFAppState().subTotal + widget.price!;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().addToCheckoutCart(
                                        _model.checkoutProduct!);
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(3.0),
                                      bottomRight: Radius.circular(3.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '7oy2rv0y' /* Add To Cart */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation']!,
                              ),
                            );
                          } else {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().subTotal =
                                        FFAppState().subTotal +
                                            (-(widget.price!));
                                    FFAppState().discountAmount =
                                        FFAppState().discountAmount +
                                            (-((widget.price!) *
                                                (widget.discount!) /
                                                100));
                                    FFAppState().sum = FFAppState().sum +
                                        (-(widget.price!) -
                                            ((widget.price!) *
                                                widget.discount!.toDouble() /
                                                100));
                                  });
                                  _model.updatePage(() {
                                    _model.itemIndex = 0;
                                  });
                                  while (_model.itemIndex <
                                      FFAppState().checkoutCart.length) {
                                    if (FFAppState()
                                            .checkoutCart[_model.itemIndex]
                                            .product
                                            .id ==
                                        widget.id) {
                                      FFAppState().update(() {
                                        FFAppState().updateCheckoutCartAtIndex(
                                          _model.itemIndex,
                                          (e) => e..quantity = null,
                                        );
                                      });
                                      FFAppState().update(() {
                                        FFAppState()
                                            .removeAtIndexFromCheckoutCart(
                                                _model.itemIndex);
                                      });
                                      break;
                                    } else {
                                      _model.updatePage(() {
                                        _model.itemIndex = _model.itemIndex + 1;
                                      });
                                    }
                                  }
                                  _model.updatePage(() {
                                    _model.updateCheckoutProductStruct(
                                      (e) => e
                                        ..quantity = null
                                        ..product = null
                                        ..totalPrice = null,
                                    );
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '756qjeo4' /* Remove */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 30.0,
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 82.0,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 9.0, 0.0),
                          child: Text(
                            widget.name!,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              formatNumber(
                                (widget.price!) -
                                    ((widget.price!) *
                                        widget.discount!.toDouble() /
                                        100),
                                formatType: FormatType.custom,
                                currency: '\$',
                                format: '0.00',
                                locale: 'en_US',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            if (widget.discount! > 0)
                              Text(
                                formatNumber(
                                  widget.price,
                                  formatType: FormatType.custom,
                                  currency: '\$',
                                  format: '0.00',
                                  locale: 'en_US',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
