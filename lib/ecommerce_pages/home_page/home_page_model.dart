import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<ProductsRecord> allProductsList = [];
  void addToAllProductsList(ProductsRecord item) => allProductsList.add(item);
  void removeFromAllProductsList(ProductsRecord item) =>
      allProductsList.remove(item);
  void removeAtIndexFromAllProductsList(int index) =>
      allProductsList.removeAt(index);
  void insertAtIndexInAllProductsList(int index, ProductsRecord item) =>
      allProductsList.insert(index, item);
  void updateAllProductsListAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      allProductsList[index] = updateFn(allProductsList[index]);

  List<ProductsRecord> listShownProductsList = [];
  void addToListShownProductsList(ProductsRecord item) =>
      listShownProductsList.add(item);
  void removeFromListShownProductsList(ProductsRecord item) =>
      listShownProductsList.remove(item);
  void removeAtIndexFromListShownProductsList(int index) =>
      listShownProductsList.removeAt(index);
  void insertAtIndexInListShownProductsList(int index, ProductsRecord item) =>
      listShownProductsList.insert(index, item);
  void updateListShownProductsListAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      listShownProductsList[index] = updateFn(listShownProductsList[index]);

  int startIndex = 0;

  int endIndex = 0;

  int pageIndex = 1;

  int prevStartIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<ProductsRecord>? allProducts;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<OrderRecord>? orderDocsList;
  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hearderModel.dispose();
    footerModel.dispose();
  }
}
