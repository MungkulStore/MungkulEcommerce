import '/admin_components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'advertisement_banner_list_widget.dart'
    show AdvertisementBannerListWidget;
import 'package:flutter/material.dart';

class AdvertisementBannerListModel
    extends FlutterFlowModel<AdvertisementBannerListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
  }
}
