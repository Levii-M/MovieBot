import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/big_movie_card/big_movie_card_widget.dart';
import '/pages/components/section_title/section_title_widget.dart';
import 'movie_details_page_widget.dart' show MovieDetailsPageWidget;
import 'package:flutter/material.dart';

class MovieDetailsPageModel extends FlutterFlowModel<MovieDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BigMovieCard component.
  late BigMovieCardModel bigMovieCardModel;
  // Model for SectionTitle component.
  late SectionTitleModel sectionTitleModel;

  @override
  void initState(BuildContext context) {
    bigMovieCardModel = createModel(context, () => BigMovieCardModel());
    sectionTitleModel = createModel(context, () => SectionTitleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bigMovieCardModel.dispose();
    sectionTitleModel.dispose();
  }
}
