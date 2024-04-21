import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  bool freeDelivery = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for Fullnamelogin widget.
  FocusNode? fullnameloginFocusNode;
  TextEditingController? fullnameloginTextController;
  String? Function(BuildContext, String?)? fullnameloginTextControllerValidator;
  // State field(s) for Addresslogin widget.
  FocusNode? addressloginFocusNode;
  TextEditingController? addressloginTextController;
  String? Function(BuildContext, String?)? addressloginTextControllerValidator;
  // State field(s) for Locationlogin widget.
  String? locationloginValue;
  FormFieldController<String>? locationloginValueController;
  // State field(s) for PhoneNumberlogin widget.
  FocusNode? phoneNumberloginFocusNode;
  TextEditingController? phoneNumberloginTextController;
  String? Function(BuildContext, String?)?
      phoneNumberloginTextControllerValidator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for Location widget.
  String? locationValue;
  FormFieldController<String>? locationValueController;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for CheckboxSave widget.
  bool? checkboxSaveValue;
  // State field(s) for CheckboxAsguest widget.
  bool? checkboxAsguestValue;
  // State field(s) for AdditionalDetail widget.
  FocusNode? additionalDetailFocusNode;
  TextEditingController? additionalDetailTextController;
  String? Function(BuildContext, String?)?
      additionalDetailTextControllerValidator;
  // State field(s) for ABA widget.
  bool? abaValue;
  // State field(s) for OnDelivery widget.
  bool? onDeliveryValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderRecord? orderPlaced;
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
    fullnameloginFocusNode?.dispose();
    fullnameloginTextController?.dispose();

    addressloginFocusNode?.dispose();
    addressloginTextController?.dispose();

    phoneNumberloginFocusNode?.dispose();
    phoneNumberloginTextController?.dispose();

    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    additionalDetailFocusNode?.dispose();
    additionalDetailTextController?.dispose();

    footerModel.dispose();
  }
}
