import '/flutter_flow/flutter_flow_util.dart';
import 'favorite_movie_page_widget.dart' show FavoriteMoviePageWidget;
import 'package:flutter/material.dart';

class FavoriteMoviePageModel extends FlutterFlowModel<FavoriteMoviePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
