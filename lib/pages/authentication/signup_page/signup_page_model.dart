import '/flutter_flow/flutter_flow_util.dart';
import 'signup_page_widget.dart' show SignupPageWidget;
import 'package:flutter/material.dart';

class SignupPageModel extends FlutterFlowModel<SignupPageWidget> {
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
      return 'Email is required!';
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

    if (val.length < 10) {
      return 'should be at least 10 characters';
    }

    if (!RegExp('^(?!.*(.)\\1{4})(?=.*[0-9])(?=.*[\\W_])(?=.*[A-Z]).{11,}\$')
        .hasMatch(val)) {
      return 'Should have 1 number,Capital letter,special character.';
    }
    return null;
  }

  // State field(s) for confirmPassField widget.
  FocusNode? confirmPassFieldFocusNode;
  TextEditingController? confirmPassFieldTextController;
  late bool confirmPassFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPassFieldTextControllerValidator;
  String? _confirmPassFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passFieldVisibility = false;
    passFieldTextControllerValidator = _passFieldTextControllerValidator;
    confirmPassFieldVisibility = false;
    confirmPassFieldTextControllerValidator =
        _confirmPassFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passFieldFocusNode?.dispose();
    passFieldTextController?.dispose();

    confirmPassFieldFocusNode?.dispose();
    confirmPassFieldTextController?.dispose();
  }
}
