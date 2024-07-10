import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/episode_card/episode_card_widget.dart';
import '/pages/components/tv_shows_big_card/tv_shows_big_card_widget.dart';
import 'tv_shows_details_page_widget.dart' show TvShowsDetailsPageWidget;
import 'package:flutter/material.dart';

class TvShowsDetailsPageModel
    extends FlutterFlowModel<TvShowsDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TvShowsBigCard component.
  late TvShowsBigCardModel tvShowsBigCardModel;
  // Model for EpisodeCard component.
  late EpisodeCardModel episodeCardModel;

  @override
  void initState(BuildContext context) {
    tvShowsBigCardModel = createModel(context, () => TvShowsBigCardModel());
    episodeCardModel = createModel(context, () => EpisodeCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tvShowsBigCardModel.dispose();
    episodeCardModel.dispose();
  }
}
