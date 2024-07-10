import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_bot_page_widget.dart' show AIBotPageWidget;
import 'package:flutter/material.dart';

class AIBotPageModel extends FlutterFlowModel<AIBotPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for promptField widget.
  FocusNode? promptFieldFocusNode;
  TextEditingController? promptFieldTextController;
  String? Function(BuildContext, String?)? promptFieldTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? result;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    promptFieldFocusNode?.dispose();
    promptFieldTextController?.dispose();
  }
}
