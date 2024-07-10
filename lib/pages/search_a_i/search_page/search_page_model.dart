import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/search_text/search_text_widget.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Search Movies)] action in TextField widget.
  ApiCallResponse? apiResult;
  // Stores action output result for [Backend Call - API (Search Tv Shows)] action in TextField widget.
  ApiCallResponse? apiResult2;
  // Model for SearchText component.
  late SearchTextModel searchTextModel;

  @override
  void initState(BuildContext context) {
    searchTextModel = createModel(context, () => SearchTextModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    searchTextModel.dispose();
  }
}
