import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import '/user_components/product_card/product_card_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasWrapTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allProducts = await queryProductsRecordOnce(
        queryBuilder: (productsRecord) => productsRecord.where(
          'discount',
          isGreaterThan: 0,
        ),
      );
      setState(() {
        _model.allProductsList =
            _model.allProducts!.toList().cast<ProductsRecord>();
      });
      setState(() {
        _model.endIndex = _model.startIndex + 3;
      });
      setState(() {
        _model.prevStartIndex = _model.startIndex;
      });
      setState(() {
        _model.listShownProductsList = [];
      });
      while (_model.startIndex <= _model.endIndex) {
        setState(() {
          _model.addToListShownProductsList(
              _model.allProductsList[_model.startIndex]);
        });
        setState(() {
          _model.startIndex = _model.startIndex + 1;
        });
      }
      _model.orderDocsList = await queryOrderRecordOnce();
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
      'wrapOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              constraints: const BoxConstraints(
                minWidth: 1440.0,
                minHeight: 900.0,
                maxWidth: 1537.0,
                maxHeight: 960.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  130.0, 0.0, 130.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: FutureBuilder<
                                        List<
                                            AdvertismentBannerCollectionRecord>>(
                                      future:
                                          queryAdvertismentBannerCollectionRecordOnce(
                                        queryBuilder:
                                            (advertismentBannerCollectionRecord) =>
                                                advertismentBannerCollectionRecord
                                                    .orderBy('ad_image',
                                                        descending: true),
                                        limit: 3,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AdvertismentBannerCollectionRecord>
                                            containerAdvertismentBannerCollectionRecordList =
                                            snapshot.data!;
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final advertismentBanner =
                                                  containerAdvertismentBannerCollectionRecordList
                                                      .toList()
                                                      .take(4)
                                                      .toList();
                                              return SizedBox(
                                                width: double.infinity,
                                                height: 550.0,
                                                child: CarouselSlider.builder(
                                                  itemCount:
                                                      advertismentBanner.length,
                                                  itemBuilder: (context,
                                                      advertismentBannerIndex,
                                                      _) {
                                                    final advertismentBannerItem =
                                                        advertismentBanner[
                                                            advertismentBannerIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
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
                                                          context.pushNamed(
                                                            'product_Detail',
                                                            queryParameters: {
                                                              'productId':
                                                                  serializeParam(
                                                                advertismentBannerItem
                                                                    .productId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            advertismentBannerItem
                                                                .adImage,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  carouselController: _model
                                                          .carouselController ??=
                                                      CarouselController(),
                                                  options: CarouselOptions(
                                                    initialPage: max(
                                                        0,
                                                        min(
                                                            1,
                                                            advertismentBanner
                                                                    .length -
                                                                1)),
                                                    viewportFraction: 1.0,
                                                    disableCenter: true,
                                                    enlargeCenterPage: true,
                                                    enlargeFactor: 0.25,
                                                    enableInfiniteScroll: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    autoPlay: true,
                                                    autoPlayAnimationDuration:
                                                        const Duration(
                                                            milliseconds: 800),
                                                    autoPlayInterval: const Duration(
                                                        milliseconds:
                                                            (800 + 3000)),
                                                    autoPlayCurve:
                                                        Curves.linear,
                                                    pauseAutoPlayInFiniteScroll:
                                                        true,
                                                    onPageChanged: (index, _) =>
                                                        _model.carouselCurrentIndex =
                                                            index,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                    color: Color(0xFE39D2C0),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'Customer_List');
                                                },
                                                child: SizedBox(
                                                  height: 50.0,
                                                  child: VerticalDivider(
                                                    width: 20.0,
                                                    thickness: 20.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '64n86xiy' /* Today's Discount */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'libwi44i' /* Flash Sales */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (_model.pageIndex != 1)
                                                        FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: const Icon(
                                                            Icons.arrow_back,
                                                            color: Colors.white,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            if (animationsMap[
                                                                    'wrapOnActionTriggerAnimation'] !=
                                                                null) {
                                                              setState(() =>
                                                                  hasWrapTriggered =
                                                                      true);
                                                              SchedulerBinding
                                                                  .instance
                                                                  .addPostFrameCallback((_) async => animationsMap[
                                                                          'wrapOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                            }
                                                            setState(() {
                                                              _model.pageIndex =
                                                                  _model.pageIndex +
                                                                      -1;
                                                            });
                                                            setState(() {
                                                              _model.prevStartIndex =
                                                                  _model.prevStartIndex +
                                                                      -4;
                                                            });
                                                            setState(() {
                                                              _model.startIndex =
                                                                  _model
                                                                      .prevStartIndex;
                                                            });
                                                            setState(() {
                                                              _model.endIndex =
                                                                  _model.startIndex +
                                                                      3;
                                                            });
                                                            setState(() {
                                                              _model.listShownProductsList =
                                                                  [];
                                                            });
                                                            while (_model
                                                                    .startIndex <=
                                                                _model
                                                                    .endIndex) {
                                                              setState(() {
                                                                _model.addToListShownProductsList(
                                                                    _model.allProductsList[
                                                                        _model
                                                                            .startIndex]);
                                                              });
                                                              setState(() {
                                                                _model.startIndex =
                                                                    _model.startIndex +
                                                                        1;
                                                              });
                                                            }
                                                          },
                                                        ),
                                                      if (_model.startIndex !=
                                                          _model.allProductsList
                                                              .length)
                                                        FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: const Icon(
                                                            Icons.arrow_forward,
                                                            color: Colors.white,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            if (animationsMap[
                                                                    'wrapOnActionTriggerAnimation'] !=
                                                                null) {
                                                              setState(() =>
                                                                  hasWrapTriggered =
                                                                      true);
                                                              SchedulerBinding
                                                                  .instance
                                                                  .addPostFrameCallback((_) async => animationsMap[
                                                                          'wrapOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                            }
                                                            setState(() {
                                                              _model.listShownProductsList =
                                                                  [];
                                                            });
                                                            setState(() {
                                                              _model.prevStartIndex =
                                                                  _model
                                                                      .startIndex;
                                                            });
                                                            setState(() {
                                                              _model.endIndex =
                                                                  _model.startIndex +
                                                                      3;
                                                              _model.pageIndex =
                                                                  _model.pageIndex +
                                                                      1;
                                                            });
                                                            if (_model
                                                                    .endIndex >=
                                                                _model
                                                                    .allProductsList
                                                                    .length) {
                                                              setState(() {
                                                                _model
                                                                    .endIndex = _model
                                                                        .allProductsList
                                                                        .length -
                                                                    1;
                                                              });
                                                            }
                                                            while (_model
                                                                    .startIndex <=
                                                                _model
                                                                    .endIndex) {
                                                              setState(() {
                                                                _model.addToListShownProductsList(
                                                                    _model.allProductsList[
                                                                        _model
                                                                            .startIndex]);
                                                              });
                                                              setState(() {
                                                                _model.startIndex =
                                                                    _model.startIndex +
                                                                        1;
                                                              });
                                                            }
                                                          },
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 30.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 55.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final listofShownProdects =
                                                              _model
                                                                  .listShownProductsList
                                                                  .toList();
                                                          return Wrap(
                                                            spacing: 90.0,
                                                            runSpacing: 40.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: List.generate(
                                                                listofShownProdects
                                                                    .length,
                                                                (listofShownProdectsIndex) {
                                                              final listofShownProdectsItem =
                                                                  listofShownProdects[
                                                                      listofShownProdectsIndex];
                                                              return ProductCardWidget(
                                                                key: Key(
                                                                    'Keylb2_${listofShownProdectsIndex}_of_${listofShownProdects.length}'),
                                                                productRef:
                                                                    listofShownProdectsItem
                                                                        .reference,
                                                                image:
                                                                    listofShownProdectsItem
                                                                        .image
                                                                        .first,
                                                                discount:
                                                                    listofShownProdectsItem
                                                                        .discount,
                                                                name:
                                                                    listofShownProdectsItem
                                                                        .name,
                                                                price:
                                                                    listofShownProdectsItem
                                                                        .price,
                                                                aboutItem:
                                                                    listofShownProdectsItem
                                                                        .aboutItem,
                                                                description:
                                                                    listofShownProdectsItem
                                                                        .description,
                                                                status:
                                                                    listofShownProdectsItem
                                                                        .status,
                                                                id: listofShownProdectsItem
                                                                    .id,
                                                                catregory:
                                                                    listofShownProdectsItem
                                                                        .category,
                                                              );
                                                            }),
                                                          ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'wrapOnActionTriggerAnimation']!,
                                                              hasBeenTriggered:
                                                                  hasWrapTriggered);
                                                        },
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    40.0,
                                                                    0.0,
                                                                    40.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'productPage',
                                                              queryParameters: {
                                                                'isDiscount':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '42o26hpw' /* View All Products */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 200.0,
                                                            height: 50.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
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
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 60.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.031,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'c8yssqve' /* Categories */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'k75q28l9' /* Browse By Category */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      40.0, 40.0, 40.0, 0.0),
                                              child: Container(
                                                height: 165.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: StreamBuilder<
                                                    List<CategoriesRecord>>(
                                                  stream:
                                                      queryCategoriesRecord(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CategoriesRecord>
                                                        listViewCategoriesRecordList =
                                                        snapshot.data!;
                                                    return ListView.separated(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                        20.0,
                                                        0,
                                                        20.0,
                                                        0,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          listViewCategoriesRecordList
                                                              .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(width: 60.0),
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewCategoriesRecord =
                                                            listViewCategoriesRecordList[
                                                                listViewIndex];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(
                                                                        () {});

                                                                context
                                                                    .pushNamed(
                                                                  'productPage',
                                                                  queryParameters:
                                                                      {
                                                                    'categoryId':
                                                                        serializeParam(
                                                                      listViewCategoriesRecord
                                                                          .id,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 180.0,
                                                                height: 160.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            listViewCategoriesRecord.image,
                                                                            width:
                                                                                222.0,
                                                                            height:
                                                                                94.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        listViewCategoriesRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            15.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 40.0),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cy1cl69r' /* Best Selling Products */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.pushNamed(
                                                      'AdminDashboard');
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'h8ksm4fi' /* Button */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'vymv7nrq' /* Best Selling Products */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FutureBuilder<List<OrderRecord>>(
                                                future: queryOrderRecordOnce(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<OrderRecord>
                                                      containerOrderRecordList =
                                                      snapshot.data!;
                                                  return Container(
                                                    decoration: const BoxDecoration(
                                                      color: Colors.transparent,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  40.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<ProductsRecord>>(
                                                        future:
                                                            queryProductsRecordOnce(
                                                          queryBuilder: (productsRecord) =>
                                                              productsRecord.whereIn(
                                                                  'id',
                                                                  functions.bestSellingProductIds(
                                                                      containerOrderRecordList
                                                                          .toList())),
                                                          limit: 4,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ProductsRecord>
                                                              wrapProductsRecordList =
                                                              snapshot.data!;
                                                          return Wrap(
                                                            spacing: 40.0,
                                                            runSpacing: 40.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                            direction:
                                                                Axis.horizontal,
                                                            runAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalDirection:
                                                                VerticalDirection
                                                                    .down,
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: List.generate(
                                                                wrapProductsRecordList
                                                                    .length,
                                                                (wrapIndex) {
                                                              final wrapProductsRecord =
                                                                  wrapProductsRecordList[
                                                                      wrapIndex];
                                                              return ProductCardWidget(
                                                                key: Key(
                                                                    'Key0el_${wrapIndex}_of_${wrapProductsRecordList.length}'),
                                                                productRef:
                                                                    wrapProductsRecord
                                                                        .reference,
                                                                image:
                                                                    wrapProductsRecord
                                                                        .image
                                                                        .first,
                                                                discount:
                                                                    wrapProductsRecord
                                                                        .discount,
                                                                name:
                                                                    wrapProductsRecord
                                                                        .name,
                                                                price:
                                                                    wrapProductsRecord
                                                                        .price,
                                                                aboutItem:
                                                                    wrapProductsRecord
                                                                        .aboutItem,
                                                                description:
                                                                    wrapProductsRecord
                                                                        .description,
                                                                status:
                                                                    wrapProductsRecord
                                                                        .status,
                                                                id: wrapProductsRecord
                                                                    .id,
                                                                catregory:
                                                                    wrapProductsRecord
                                                                        .category,
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ].divide(const SizedBox(height: 60.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FutureBuilder<List<ProductsRecord>>(
                                    future: queryProductsRecordOnce(
                                      queryBuilder: (productsRecord) =>
                                          productsRecord.orderBy('created_at',
                                              descending: true),
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProductsRecord>
                                          containerProductsRecordList =
                                          snapshot.data!;
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                10.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'mfcqgfz1' /* Product Feature */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hajjb89j' /* New Arrival */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 520.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 40.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'product_Detail',
                                                                    queryParameters:
                                                                        {
                                                                      'productId':
                                                                          serializeParam(
                                                                        containerProductsRecordList[0]
                                                                            .id,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                  child: Image
                                                                      .network(
                                                                    containerProductsRecordList[
                                                                            0]
                                                                        .previewImage,
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                4.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              2.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                      ),
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
                                                                          context
                                                                              .pushNamed(
                                                                            'product_Detail',
                                                                            queryParameters:
                                                                                {
                                                                              'productId': serializeParam(
                                                                                containerProductsRecordList[1].id,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4.0),
                                                                          child:
                                                                              Image.network(
                                                                            containerProductsRecordList[1].previewImage,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      0.0,
                                                                                      2.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    'product_Detail',
                                                                                    queryParameters: {
                                                                                      'productId': serializeParam(
                                                                                        containerProductsRecordList[2].id,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                  child: Image.network(
                                                                                    containerProductsRecordList[2].previewImage,
                                                                                    width: double.infinity,
                                                                                    height: double.infinity,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  boxShadow: const [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        2.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      'product_Detail',
                                                                                      queryParameters: {
                                                                                        'productId': serializeParam(
                                                                                          containerProductsRecordList[3].id,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                    child: Image.network(
                                                                                      containerProductsRecordList[3].previewImage,
                                                                                      width: double.infinity,
                                                                                      height: double.infinity,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 12.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 20.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 40.0),
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
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'uid058wd' /* View All Products */,
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
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'w8d7zr2z' /* Explore Our Products */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 40.0),
                                          child: FutureBuilder<
                                              List<ProductsRecord>>(
                                            future: queryProductsRecordOnce(
                                              queryBuilder: (productsRecord) =>
                                                  productsRecord
                                                      .orderBy('name'),
                                              limit: 8,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProductsRecord>
                                                  wrapProductsRecordList =
                                                  snapshot.data!;
                                              return Wrap(
                                                spacing: 50.0,
                                                runSpacing: 40.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    wrapProductsRecordList
                                                        .length, (wrapIndex) {
                                                  final wrapProductsRecord =
                                                      wrapProductsRecordList[
                                                          wrapIndex];
                                                  return ProductCardWidget(
                                                    key: Key(
                                                        'Keyjoe_${wrapIndex}_of_${wrapProductsRecordList.length}'),
                                                    productRef:
                                                        wrapProductsRecord
                                                            .reference,
                                                    image: wrapProductsRecord
                                                        .image.first,
                                                    discount: wrapProductsRecord
                                                        .discount,
                                                    name:
                                                        wrapProductsRecord.name,
                                                    price: wrapProductsRecord
                                                        .price,
                                                    aboutItem:
                                                        wrapProductsRecord
                                                            .aboutItem,
                                                    description:
                                                        wrapProductsRecord
                                                            .description,
                                                    status: wrapProductsRecord
                                                        .status,
                                                    id: wrapProductsRecord.id,
                                                    catregory:
                                                        wrapProductsRecord
                                                            .category,
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed('productPage');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'lsqgn7xp' /* View All Products */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(2.0),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 40.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons
                                                        .airport_shuttle_outlined,
                                                    color: Color(0xFF0B0001),
                                                    size: 60.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '84u1l9z6' /* FAST DELIVERY */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.headset_mic_outlined,
                                                    color: Color(0xFF0B0001),
                                                    size: 50.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'x9ebwkg5' /* 24/7 CUSTOMER SERVICE */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.price_check_outlined,
                                                    color: Color(0xFF0B0001),
                                                    size: 54.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'nsonlfvx' /* MONEY BACK GUARANTEE */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF0B0001),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 60.0)),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
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
        ),
      ),
    );
  }
}
