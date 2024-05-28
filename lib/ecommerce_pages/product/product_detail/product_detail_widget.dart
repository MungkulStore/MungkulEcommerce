import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import '/user_components/product_card/product_card_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    this.productId,
    this.cstegoryId,
  });

  final String? productId;
  final String? cstegoryId;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with TickerProviderStateMixin {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.productOutput = await queryProductsRecordOnce(
        queryBuilder: (productsRecord) => productsRecord.where(
          'id',
          isEqualTo: widget.productId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      setState(() {
        _model.imageView = _model.productOutput!.image.first;
      });
      while (_model.itemIndex < FFAppState().checkoutCart.length) {
        if (FFAppState().checkoutCart[_model.itemIndex].product.id ==
            widget.productId) {
          return;
        }

        _model.itemIndex = _model.itemIndex + 1;
      }
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().update(() {});
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            StreamBuilder<List<ProductsRecord>>(
                              stream: queryProductsRecord(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'id',
                                  isEqualTo: widget.productId,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ProductsRecord>
                                    containerProductsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerProductsRecord =
                                    containerProductsRecordList.isNotEmpty
                                        ? containerProductsRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height: 704.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 170.0,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final image =
                                                  (containerProductsRecord
                                                              ?.image
                                                              .toList() ??
                                                          [])
                                                      .take(4)
                                                      .toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount: image.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 20.0),
                                                itemBuilder:
                                                    (context, imageIndex) {
                                                  final imageItem =
                                                      image[imageIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5F5),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.imageView =
                                                                  containerProductsRecord
                                                                          .image[
                                                                      imageIndex];
                                                            });
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              containerProductsRecord!
                                                                      .image[
                                                                  imageIndex],
                                                              width: 150.0,
                                                              height: 140.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 20.0)),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  25.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    _model.imageView,
                                                    width: 530.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.59,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 15.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (FFAppState()
                                                            .checkoutCart
                                                            .where((e) =>
                                                                e.product.id ==
                                                                widget
                                                                    .productId)
                                                            .toList().isEmpty) {
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 150.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  _model.currentProduct =
                                                                      null;
                                                                });
                                                                setState(() {
                                                                  _model.currentProduct =
                                                                      ProductStruct(
                                                                    name: containerProductsRecord
                                                                        ?.name,
                                                                    description:
                                                                        containerProductsRecord
                                                                            ?.description,
                                                                    aboutItem:
                                                                        containerProductsRecord
                                                                            ?.aboutItem,
                                                                    status: containerProductsRecord
                                                                        ?.status,
                                                                    discount:
                                                                        containerProductsRecord
                                                                            ?.discount,
                                                                    category:
                                                                        containerProductsRecord
                                                                            ?.category,
                                                                    image: containerProductsRecord
                                                                        ?.image
                                                                        .first,
                                                                    id: containerProductsRecord
                                                                        ?.id,
                                                                    productRef:
                                                                        containerProductsRecord
                                                                            ?.productRef,
                                                                    price: containerProductsRecord!
                                                                            .price -
                                                                        (containerProductsRecord.price *
                                                                            containerProductsRecord.discount.toDouble() /
                                                                            100),
                                                                    basePrice:
                                                                        containerProductsRecord
                                                                            .price,
                                                                  );
                                                                });
                                                                setState(() {
                                                                  _model
                                                                      .updateCheckoutProductStruct(
                                                                    (e) => e
                                                                      ..incrementQuantity(
                                                                          1)
                                                                      ..product =
                                                                          _model
                                                                              .currentProduct
                                                                      ..totalPrice = _model
                                                                          .currentProduct
                                                                          ?.price,
                                                                  );
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .sum = FFAppState()
                                                                          .sum +
                                                                      _model
                                                                          .currentProduct!
                                                                          .price;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .discountAmount = FFAppState()
                                                                          .discountAmount +
                                                                      (containerProductsRecord!
                                                                              .price *
                                                                          containerProductsRecord
                                                                              .discount /
                                                                          100);
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .subTotal =
                                                                      containerProductsRecord!
                                                                          .price;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .addToCheckoutCart(
                                                                          _model
                                                                              .checkoutProduct!);
                                                                });

                                                                context
                                                                    .pushNamed(
                                                                  'Checkout',
                                                                  queryParameters:
                                                                      {
                                                                    'deliveryOption':
                                                                        serializeParam(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'tgur89z9' /* Express delivery */,
                                                                      ),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'isGetinplace':
                                                                        serializeParam(
                                                                      false,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'bro9ffp1' /* Buy Now */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.0),
                                                              ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            borderRadius: 8.0,
                                                            borderWidth: 0.0,
                                                            buttonSize: 35.0,
                                                            fillColor: const Color(
                                                                0x00E2C721),
                                                            icon: Icon(
                                                              Icons
                                                                  .shopping_cart_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 20.0,
                                                            ),
                                                            showLoadingIndicator:
                                                                true,
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                _model.currentProduct =
                                                                    null;
                                                              });
                                                              setState(() {
                                                                _model.currentProduct =
                                                                    ProductStruct(
                                                                  name:
                                                                      containerProductsRecord
                                                                          ?.name,
                                                                  description:
                                                                      containerProductsRecord
                                                                          ?.description,
                                                                  aboutItem:
                                                                      containerProductsRecord
                                                                          ?.aboutItem,
                                                                  status:
                                                                      containerProductsRecord
                                                                          ?.status,
                                                                  discount:
                                                                      containerProductsRecord
                                                                          ?.discount,
                                                                  category:
                                                                      containerProductsRecord
                                                                          ?.category,
                                                                  image: containerProductsRecord
                                                                      ?.image
                                                                      .first,
                                                                  id: containerProductsRecord
                                                                      ?.id,
                                                                  productRef:
                                                                      containerProductsRecord
                                                                          ?.productRef,
                                                                  price: containerProductsRecord!
                                                                          .price -
                                                                      (containerProductsRecord
                                                                              .price *
                                                                          containerProductsRecord
                                                                              .discount
                                                                              .toDouble() /
                                                                          100),
                                                                  basePrice:
                                                                      containerProductsRecord
                                                                          .price,
                                                                );
                                                              });
                                                              setState(() {
                                                                _model
                                                                    .updateCheckoutProductStruct(
                                                                  (e) => e
                                                                    ..incrementQuantity(
                                                                        1)
                                                                    ..product =
                                                                        _model
                                                                            .currentProduct
                                                                    ..totalPrice = _model
                                                                        .currentProduct
                                                                        ?.price,
                                                                );
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .sum = FFAppState()
                                                                        .sum +
                                                                    _model
                                                                        .currentProduct!
                                                                        .price;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .discountAmount = FFAppState()
                                                                        .discountAmount +
                                                                    (containerProductsRecord!
                                                                            .price *
                                                                        containerProductsRecord
                                                                            .discount /
                                                                        100);
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .subTotal = FFAppState()
                                                                        .subTotal +
                                                                    _model
                                                                        .currentProduct!
                                                                        .basePrice;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .addToCheckoutCart(
                                                                        _model
                                                                            .checkoutProduct!);
                                                              });
                                                            },
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 25.0)),
                                                      );
                                                    } else {
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 150.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            ),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .subTotal = FFAppState()
                                                                          .subTotal +
                                                                      (-containerProductsRecord!
                                                                          .price);
                                                                  FFAppState()
                                                                      .discountAmount = FFAppState()
                                                                          .discountAmount +
                                                                      (-(containerProductsRecord
                                                                              .price *
                                                                          containerProductsRecord
                                                                              .discount /
                                                                          100));
                                                                  FFAppState()
                                                                      .sum = FFAppState()
                                                                          .sum +
                                                                      (-containerProductsRecord
                                                                              .price -
                                                                          (containerProductsRecord.price *
                                                                              containerProductsRecord.discount.toDouble() /
                                                                              100));
                                                                });
                                                                setState(() {
                                                                  _model.itemIndex =
                                                                      0;
                                                                });
                                                                while (_model
                                                                        .itemIndex <
                                                                    FFAppState()
                                                                        .checkoutCart
                                                                        .length) {
                                                                  if (FFAppState()
                                                                          .checkoutCart[_model
                                                                              .itemIndex]
                                                                          .product
                                                                          .id ==
                                                                      containerProductsRecord
                                                                          ?.id) {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .updateCheckoutCartAtIndex(
                                                                        _model
                                                                            .itemIndex,
                                                                        (e) => e
                                                                          ..quantity =
                                                                              null,
                                                                      );
                                                                    });
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .removeAtIndexFromCheckoutCart(
                                                                              _model.itemIndex);
                                                                    });
                                                                    break;
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      _model.itemIndex =
                                                                          _model.itemIndex +
                                                                              1;
                                                                    });
                                                                  }
                                                                }
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'af76lrd5' /* Remove */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 30.0,
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.0),
                                                              ),
                                                            ),
                                                          ),
                                                          AlignedTooltip(
                                                            content: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'amb5ctsk' /* Go to Cart */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            offset: 4.0,
                                                            preferredDirection:
                                                                AxisDirection
                                                                    .up,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            elevation: 4.0,
                                                            tailBaseWidth: 5.0,
                                                            tailLength: 5.0,
                                                            waitDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        10),
                                                            showDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        100),
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .tap,
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              borderRadius: 8.0,
                                                              borderWidth: 0.0,
                                                              buttonSize: 35.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .shopping_cart_checkout_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                              showLoadingIndicator:
                                                                  true,
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                        'Cart');
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 25.0)),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                              Container(
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 180.0,
                                                      height: 102.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                .addToCompareProducts(
                                                                    containerProductsRecord!
                                                                        .id);
                                                          });

                                                          context.pushNamed(
                                                              'Compare_products');
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .change_circle_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 25.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'hocvx2c4' /* Compare Product */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ]
                                                              .divide(const SizedBox(
                                                                  width: 10.0))
                                                              .around(const SizedBox(
                                                                  width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                            .checkoutCart
                                                            .where((e) =>
                                                                e.product.id ==
                                                                widget
                                                                    .productId)
                                                            .toList().isNotEmpty)
                                                      SizedBox(
                                                        height: 80.0,
                                                        child: VerticalDivider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                    if (FFAppState()
                                                            .checkoutCart
                                                            .where((e) =>
                                                                e.product.id ==
                                                                widget
                                                                    .productId)
                                                            .toList().isNotEmpty)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 150.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
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
                                                                      if (FFAppState()
                                                                              .checkoutCart[_model.itemIndex]
                                                                              .quantity >
                                                                          1) {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().sum =
                                                                              FFAppState().sum + (-(containerProductsRecord!.price - (containerProductsRecord.price * containerProductsRecord.discount.toDouble() / 100)));
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().subTotal =
                                                                              FFAppState().subTotal + (-containerProductsRecord!.price);
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().discountAmount =
                                                                              FFAppState().discountAmount + (-containerProductsRecord!.price * containerProductsRecord.discount / 100);
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState()
                                                                              .updateCheckoutCartAtIndex(
                                                                            _model.itemIndex,
                                                                            (e) => e
                                                                              ..incrementQuantity(-1)
                                                                              ..incrementTotalPrice(-containerProductsRecord!.price - (containerProductsRecord.price * containerProductsRecord.discount.toDouble() / 100)),
                                                                          );
                                                                        });
                                                                        return;
                                                                      } else {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().sum =
                                                                              FFAppState().sum + (-(containerProductsRecord!.price - (containerProductsRecord.price * containerProductsRecord.discount.toDouble() / 100)));
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().subTotal =
                                                                              FFAppState().subTotal + (-containerProductsRecord!.price);
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().discountAmount =
                                                                              FFAppState().discountAmount + (-containerProductsRecord!.price * containerProductsRecord.discount / 100);
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState()
                                                                              .updateCheckoutCartAtIndex(
                                                                            _model.itemIndex,
                                                                            (e) => e
                                                                              ..incrementQuantity(-1)
                                                                              ..incrementTotalPrice(-containerProductsRecord!.price - (containerProductsRecord.price * containerProductsRecord.discount.toDouble() / 100)),
                                                                          );
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState()
                                                                              .removeAtIndexFromCheckoutCart(_model.itemIndex);
                                                                        });
                                                                        return;
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(6.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .minus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFAppState()
                                                                          .checkoutCart[
                                                                              _model.itemIndex]
                                                                          .quantity
                                                                          .toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .updateCheckoutCartAtIndex(
                                                                          _model
                                                                              .itemIndex,
                                                                          (e) => e
                                                                            ..incrementQuantity(1)
                                                                            ..incrementTotalPrice(containerProductsRecord!.price - (containerProductsRecord.price * containerProductsRecord.discount.toDouble() / 100)),
                                                                        );
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .sum = FFAppState()
                                                                                .sum +
                                                                            (containerProductsRecord!.price -
                                                                                (containerProductsRecord.price * containerProductsRecord.discount.toDouble() / 100));
                                                                        FFAppState()
                                                                            .discountAmount = FFAppState()
                                                                                .discountAmount +
                                                                            (containerProductsRecord.price *
                                                                                containerProductsRecord.discount /
                                                                                100);
                                                                        FFAppState()
                                                                            .subTotal = FFAppState()
                                                                                .subTotal +
                                                                            containerProductsRecord.price;
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(6.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .plus,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ].addToEnd(
                                                      const SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 600.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  containerProductsRecord!.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  formatNumber(
                                                    containerProductsRecord
                                                        .price,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '\$',
                                                    format: '0.00',
                                                    locale: '',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: Text(
                                                    containerProductsRecord
                                                        .description,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                const Divider(
                                                  thickness: 3.0,
                                                  color: Color(0x7B39D2C0),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    25.0),
                                                        child: Text(
                                                          containerProductsRecord
                                                              .aboutItem,
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 10,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 2.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<ProductsRecord>>(
                              stream: queryProductsRecord(
                                queryBuilder: (productsRecord) => productsRecord
                                    .where(
                                      'id',
                                      isNotEqualTo: widget.productId,
                                    )
                                    .where(
                                      'category',
                                      isEqualTo: widget.cstegoryId,
                                    )
                                    .orderBy('id'),
                                limit: 4,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ProductsRecord>
                                    containerProductsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              height: 50.0,
                                              child: VerticalDivider(
                                                width: 20.0,
                                                thickness: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'avvbrbpa' /* Related Products */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 16.0)),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (containerProductsRecordList.isNotEmpty) {
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 55.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 370.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final containerVar =
                                                              containerProductsRecordList
                                                                  .toList()
                                                                  .take(4)
                                                                  .toList();
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: List.generate(
                                                                containerVar
                                                                    .length,
                                                                (containerVarIndex) {
                                                              final containerVarItem =
                                                                  containerVar[
                                                                      containerVarIndex];
                                                              return ProductCardWidget(
                                                                key: Key(
                                                                    'Keyqiq_${containerVarIndex}_of_${containerVar.length}'),
                                                                productRef:
                                                                    containerVarItem
                                                                        .reference,
                                                                image:
                                                                    containerVarItem
                                                                        .image
                                                                        .first,
                                                                discount:
                                                                    containerVarItem
                                                                        .discount,
                                                                name:
                                                                    containerVarItem
                                                                        .name,
                                                                price:
                                                                    containerVarItem
                                                                        .price,
                                                                aboutItem:
                                                                    containerVarItem
                                                                        .aboutItem,
                                                                description:
                                                                    containerVarItem
                                                                        .description,
                                                                status:
                                                                    containerVarItem
                                                                        .status,
                                                                id: containerVarItem
                                                                    .id,
                                                                catregory:
                                                                    containerVarItem
                                                                        .category,
                                                              );
                                                            }).divide(const SizedBox(
                                                                width: 77.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 181.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .remove_shopping_cart_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'jsfbujlr' /* No Products Available */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      50.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 25.0)),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
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
