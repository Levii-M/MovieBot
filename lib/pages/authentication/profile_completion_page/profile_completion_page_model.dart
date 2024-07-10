import '/flutter_flow/flutter_flow_util.dart';
import 'profile_completion_page_widget.dart' show ProfileCompletionPageWidget;
import 'package:flutter/material.dart';

class ProfileCompletionPageModel
    extends FlutterFlowModel<ProfileCompletionPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for usernameField widget.
  FocusNode? usernameFieldFocusNode;
  TextEditingController? usernameFieldTextController;
  String? Function(BuildContext, String?)? usernameFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    usernameFieldFocusNode?.dispose();
    usernameFieldTextController?.dispose();
  }
}
