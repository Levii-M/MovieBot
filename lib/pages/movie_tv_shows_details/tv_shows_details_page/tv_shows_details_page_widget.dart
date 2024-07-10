import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/episode_card/episode_card_widget.dart';
import '/pages/components/episodes/episodes_widget.dart';
import '/pages/components/movie_card/movie_card_widget.dart';
import '/pages/components/season_card/season_card_widget.dart';
import '/pages/components/tv_shows_big_card/tv_shows_big_card_widget.dart';
import 'package:flutter/material.dart';
import 'tv_shows_details_page_model.dart';
export 'tv_shows_details_page_model.dart';

class TvShowsDetailsPageWidget extends StatefulWidget {
  const TvShowsDetailsPageWidget({
    super.key,
    required this.tvid,
  });

  final int? tvid;

  @override
  State<TvShowsDetailsPageWidget> createState() =>
      _TvShowsDetailsPageWidgetState();
}

class _TvShowsDetailsPageWidgetState extends State<TvShowsDetailsPageWidget> {
  late TvShowsDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TvShowsDetailsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: TvShowsDetailsCall.call(
              tvId: widget.tvid,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final columnTvShowsDetailsResponse = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.tvShowsBigCardModel,
                      updateCallback: () => setState(() {}),
                      child: TvShowsBigCardWidget(
                        image: valueOrDefault<String>(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${getJsonField(
                            columnTvShowsDetailsResponse.jsonBody,
                            r'''$.backdrop_path''',
                          ).toString()}',
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jcEl8SISNfGdlQFwLzeEtsjDvpw.jpg',
                        ),
                        title: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.name''',
                        ).toString(),
                        lastAirEpisode: 'Last Air: S${getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.last_episode_to_air.season_number''',
                        ).toString()}E${getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.last_episode_to_air.episode_number''',
                        ).toString()}',
                        genre: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.genres[0:2]..name''',
                        ).toString(),
                        nomOfSeasons: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.number_of_seasons''',
                        ),
                        rating: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.vote_average''',
                        ),
                        numOfVotes: getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.vote_count''',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Text(
                        'Story',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Text(
                        getJsonField(
                          columnTvShowsDetailsResponse.jsonBody,
                          r'''$.overview''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 24.0),
                      child: Text(
                        'Last Episode On Air',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: wrapWithModel(
                        model: _model.episodeCardModel,
                        updateCallback: () => setState(() {}),
                        child: EpisodeCardWidget(
                          image: valueOrDefault<String>(
                            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/${getJsonField(
                              columnTvShowsDetailsResponse.jsonBody,
                              r'''$.last_episode_to_air.still_path''',
                            ).toString()}',
                            'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/nmg2lY4QuyXQrAnrC2lRblK5rT6.jpg',
                          ),
                          episode: 'Episode ${getJsonField(
                            columnTvShowsDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.episode_number''',
                          ).toString()}',
                          name: getJsonField(
                            columnTvShowsDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.name''',
                          ).toString(),
                          duration: '${getJsonField(
                            columnTvShowsDetailsResponse.jsonBody,
                            r'''$.last_episode_to_air.runtime''',
                          ).toString()} min',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 24.0),
                      child: Text(
                        'Seasons',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final seasons = getJsonField(
                              columnTvShowsDetailsResponse.jsonBody,
                              r'''$.seasons''',
                            ).toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: seasons.length,
                              itemBuilder: (context, seasonsIndex) {
                                final seasonsItem = seasons[seasonsIndex];
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 16.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.85,
                                                      child: EpisodesWidget(
                                                        tvid: widget.tvid!,
                                                        seasonNumber:
                                                            getJsonField(
                                                          seasonsItem,
                                                          r'''$.season_number''',
                                                        ),
                                                        tvShowName:
                                                            getJsonField(
                                                          columnTvShowsDetailsResponse
                                                              .jsonBody,
                                                          r'''$.name''',
                                                        ).toString(),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: SeasonCardWidget(
                                            key: Key(
                                                'Keyhab_${seasonsIndex}_of_${seasons.length}'),
                                            image: valueOrDefault<String>(
                                              'https://media.themoviedb.org/t/p/w130_and_h195_bestv2/${getJsonField(
                                                seasonsItem,
                                                r'''$.poster_path''',
                                              ).toString()}',
                                              'https://media.themoviedb.org/t/p/w130_and_h195_bestv2/jcEl8SISNfGdlQFwLzeEtsjDvpw.jpg',
                                            ),
                                            season: getJsonField(
                                              seasonsItem,
                                              r'''$.name''',
                                            ).toString(),
                                            numOfEpisodes: getJsonField(
                                              seasonsItem,
                                              r'''$.episode_count''',
                                            ),
                                            airDate: getJsonField(
                                              seasonsItem,
                                              r'''$.air_date''',
                                            ).toString(),
                                            overview: getJsonField(
                                              seasonsItem,
                                              r'''$.overview''',
                                            ).toString(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Text(
                        'Similar',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 224.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: SimilarTvShowsCall.call(
                          tvId: widget.tvid,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewSimilarTvShowsResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final similarTvShows = SimilarTvShowsCall.results(
                                    listViewSimilarTvShowsResponse.jsonBody,
                                  )?.toList() ??
                                  [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: similarTvShows.length,
                                itemBuilder: (context, similarTvShowsIndex) {
                                  final similarTvShowsItem =
                                      similarTvShows[similarTvShowsIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'tvShowsDetailsPage',
                                          queryParameters: {
                                            'tvid': serializeParam(
                                              getJsonField(
                                                similarTvShowsItem,
                                                r'''$.id''',
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: MovieCardWidget(
                                        key: Key(
                                            'Keyize_${similarTvShowsIndex}_of_${similarTvShows.length}'),
                                        image: valueOrDefault<String>(
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${valueOrDefault<String>(
                                            getJsonField(
                                              similarTvShowsItem,
                                              r'''$.poster_path''',
                                            )?.toString(),
                                            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                          )}',
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                        ),
                                        title: getJsonField(
                                          similarTvShowsItem,
                                          r'''$.name''',
                                        ).toString(),
                                        rating: getJsonField(
                                          similarTvShowsItem,
                                          r'''$.vote_average''',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 16.0, 24.0, 16.0),
                      child: Text(
                        'Recommendation',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 224.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: TvShowsRecommendationCall.call(
                          tvId: widget.tvid,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewTvShowsRecommendationResponse =
                              snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final recommendationrTvShows =
                                  TvShowsRecommendationCall.results(
                                        listViewTvShowsRecommendationResponse
                                            .jsonBody,
                                      )?.toList() ??
                                      [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: recommendationrTvShows.length,
                                itemBuilder:
                                    (context, recommendationrTvShowsIndex) {
                                  final recommendationrTvShowsItem =
                                      recommendationrTvShows[
                                          recommendationrTvShowsIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'tvShowsDetailsPage',
                                          queryParameters: {
                                            'tvid': serializeParam(
                                              getJsonField(
                                                recommendationrTvShowsItem,
                                                r'''$.id''',
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: MovieCardWidget(
                                        key: Key(
                                            'Keyqac_${recommendationrTvShowsIndex}_of_${recommendationrTvShows.length}'),
                                        image: valueOrDefault<String>(
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${valueOrDefault<String>(
                                            getJsonField(
                                              recommendationrTvShowsItem,
                                              r'''$.poster_path''',
                                            )?.toString(),
                                            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                          )}',
                                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                        ),
                                        title: getJsonField(
                                          recommendationrTvShowsItem,
                                          r'''$.name''',
                                        ).toString(),
                                        rating: getJsonField(
                                          recommendationrTvShowsItem,
                                          r'''$.vote_average''',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
