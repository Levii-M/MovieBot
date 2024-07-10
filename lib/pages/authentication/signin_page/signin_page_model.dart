import '/flutter_flow/flutter_flow_util.dart';
import 'signin_page_widget.dart' show SigninPageWidget;
import 'package:flutter/material.dart';

class SigninPageModel extends FlutterFlowModel<SigninPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp('.*@.*\\.(?:com|ph|edu\\.ph)\$').hasMatch(val)) {
      return 'Email must contain an \'@\' symbol and a \'.\' to be valid.';
    }
    return null;
  }

  // State field(s) for passField widget.
  FocusNode? passFieldFocusNode;
  TextEditingController? passFieldTextController;
  late bool passFieldVisibility;
  String? Function(BuildContext, String?)? passFieldTextControllerValidator;
  String? _passFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passFieldVisibility = false;
    passFieldTextControllerValidator = _passFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldTextController?.dispose();
  }
}
