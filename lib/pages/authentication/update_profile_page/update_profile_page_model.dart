import '/flutter_flow/flutter_flow_util.dart';
import 'update_profile_page_widget.dart' show UpdateProfilePageWidget;
import 'package:flutter/material.dart';

class UpdateProfilePageModel extends FlutterFlowModel<UpdateProfilePageWidget> {
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
