import '/flutter_flow/flutter_flow_util.dart';
import 'favorite_tvshows_page_widget.dart' show FavoriteTvshowsPageWidget;
import 'package:flutter/material.dart';

class FavoriteTvshowsPageModel
    extends FlutterFlowModel<FavoriteTvshowsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
