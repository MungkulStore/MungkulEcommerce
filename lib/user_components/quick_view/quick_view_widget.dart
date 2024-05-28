import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'quick_view_model.dart';
export 'quick_view_model.dart';

class QuickViewWidget extends StatefulWidget {
  const QuickViewWidget({
    super.key,
    this.quickView,
  });

  final DocumentReference? quickView;

  @override
  State<QuickViewWidget> createState() => _QuickViewWidgetState();
}

class _QuickViewWidgetState extends State<QuickViewWidget> {
  late QuickViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuickViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
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
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: FutureBuilder<ProductsRecord>(
            future: ProductsRecord.getDocumentOnce(widget.quickView!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final containerProductsRecord = snapshot.data!;
              return Container(
                width: 1000.0,
                height: 500.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 5.0,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 25.0, 30.0, 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final image = containerProductsRecord
                                              .image
                                              .toList()
                                              .take(4)
                                              .toList();
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(
                                                image.length, (imageIndex) {
                                              final imageItem =
                                                  image[imageIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {
                                                    _model.imageView =
                                                        containerProductsRecord
                                                            .image[imageIndex];
                                                    _model.click = true;
                                                  });
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    containerProductsRecord
                                                        .image[imageIndex],
                                                    width: 93.0,
                                                    height: 76.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            }).divide(const SizedBox(height: 16.0)),
                                          );
                                        },
                                      ),
                                      Container(
                                        constraints: const BoxConstraints(
                                          minWidth: 300.0,
                                          maxWidth: 330.0,
                                        ),
                                        decoration: const BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            _model.click == false
                                                ? containerProductsRecord
                                                    .image.first
                                                : _model.imageView,
                                            height: 334.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 15.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          containerProductsRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        AutoSizeText(
                                          containerProductsRecord.description,
                                          maxLines: 4,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7nopfxyw' /* Availability: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              containerProductsRecord.status,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 15.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zxfg870j' /* Category:  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              containerProductsRecord.category,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 15.0)),
                                        ),
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3z4ff76a' /* Base Price: */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  formatNumber(
                                                    containerProductsRecord
                                                            .price -
                                                        (containerProductsRecord
                                                                .price *
                                                            containerProductsRecord
                                                                .discount
                                                                .toDouble() /
                                                            100),
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '\$',
                                                    format: '0.00',
                                                    locale: '',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 32.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(height: 15.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    setState(() {
                                                      _model.currentProducts =
                                                          null;
                                                    });
                                                    setState(() {
                                                      _model.currentProducts =
                                                          ProductStruct(
                                                        name:
                                                            containerProductsRecord
                                                                .name,
                                                        description:
                                                            containerProductsRecord
                                                                .description,
                                                        aboutItem:
                                                            containerProductsRecord
                                                                .aboutItem,
                                                        status:
                                                            containerProductsRecord
                                                                .status,
                                                        discount:
                                                            containerProductsRecord
                                                                .discount,
                                                        category:
                                                            containerProductsRecord
                                                                .category,
                                                        image:
                                                            containerProductsRecord
                                                                .image.first,
                                                        id: containerProductsRecord
                                                            .id,
                                                        productRef:
                                                            containerProductsRecord
                                                                .reference,
                                                        price: containerProductsRecord
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
                                                      _model
                                                          .updateCheckoutProductsStruct(
                                                        (e) => e
                                                          ..incrementQuantity(1)
                                                          ..product = _model
                                                              .currentProducts
                                                          ..totalPrice =
                                                              containerProductsRecord
                                                                  .price,
                                                      );
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .sum = FFAppState()
                                                              .sum +
                                                          _model
                                                              .currentProducts!
                                                              .price;
                                                      FFAppState()
                                                          .discountAmount = FFAppState()
                                                              .discountAmount +
                                                          (containerProductsRecord
                                                                  .price *
                                                              containerProductsRecord
                                                                  .discount
                                                                  .toDouble() /
                                                              100);
                                                      FFAppState()
                                                          .subTotal = FFAppState()
                                                              .subTotal +
                                                          containerProductsRecord
                                                              .price;
                                                      FFAppState()
                                                          .addToCheckoutCart(_model
                                                              .checkoutProducts!);
                                                    });

                                                    context.pushNamed('Cart');
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'zoyag0qn' /* Add to Cart */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    hoverColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    hoverTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  hoverIconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  icon: Icon(
                                                    Icons
                                                        .change_circle_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed: () async {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .addToCompareProducts(
                                                              containerProductsRecord
                                                                  .id);
                                                    });

                                                    context.pushNamed(
                                                        'Compare_products');
                                                  },
                                                ),
                                              ].divide(const SizedBox(width: 15.0)),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 25.0)),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 35.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.97, -0.94),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 13.0,
                        borderWidth: 2.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
