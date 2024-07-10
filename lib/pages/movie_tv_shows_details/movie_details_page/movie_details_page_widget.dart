import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/big_movie_card/big_movie_card_widget.dart';
import '/pages/components/cast_card/cast_card_widget.dart';
import '/pages/components/movie_card/movie_card_widget.dart';
import '/pages/components/review_card/review_card_widget.dart';
import '/pages/components/section_title/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'movie_details_page_model.dart';
export 'movie_details_page_model.dart';

class MovieDetailsPageWidget extends StatefulWidget {
  const MovieDetailsPageWidget({
    super.key,
    required this.movieid,
  });

  final int? movieid;

  @override
  State<MovieDetailsPageWidget> createState() => _MovieDetailsPageWidgetState();
}

class _MovieDetailsPageWidgetState extends State<MovieDetailsPageWidget> {
  late MovieDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieDetailsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: MovieDetailsCall.call(
        movieId: widget.movieid,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final movieDetailsPageMovieDetailsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.bigMovieCardModel,
                    updateCallback: () => setState(() {}),
                    child: BigMovieCardWidget(
                      image: valueOrDefault<String>(
                        'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/${getJsonField(
                          movieDetailsPageMovieDetailsResponse.jsonBody,
                          r'''$.backdrop_path''',
                        ).toString()}',
                        'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/fY3lD0jM5AoHJMunjGWqJ0hRteI.jpg',
                      ),
                      title: getJsonField(
                        movieDetailsPageMovieDetailsResponse.jsonBody,
                        r'''$.title''',
                      ).toString(),
                      releaseYear: getJsonField(
                        movieDetailsPageMovieDetailsResponse.jsonBody,
                        r'''$.release_date''',
                      ).toString(),
                      genre: getJsonField(
                        movieDetailsPageMovieDetailsResponse.jsonBody,
                        r'''$.genres[0:2]..name''',
                      ).toString(),
                      duration: '${getJsonField(
                        movieDetailsPageMovieDetailsResponse.jsonBody,
                        r'''$.runtime''',
                      ).toString()}minutes',
                      rating: getJsonField(
                        movieDetailsPageMovieDetailsResponse.jsonBody,
                        r'''$.vote_average''',
                      ),
                      numOfVotes: getJsonField(
                        movieDetailsPageMovieDetailsResponse.jsonBody,
                        r'''$.vote_count''',
                      ).toString(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
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
                        const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                    child: Text(
                      getJsonField(
                        movieDetailsPageMovieDetailsResponse.jsonBody,
                        r'''$.overview''',
                      ).toString(),
                      textAlign: TextAlign.justify,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
                    child: wrapWithModel(
                      model: _model.sectionTitleModel,
                      updateCallback: () => setState(() {}),
                      child: const SectionTitleWidget(
                        title: 'Cast',
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 120.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: FutureBuilder<ApiCallResponse>(
                      future: MovieCastsCall.call(
                        movieId: widget.movieid,
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
                        final listViewMovieCastsResponse = snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final casts = (MovieCastsCall.casts(
                                      listViewMovieCastsResponse.jsonBody,
                                    )?.toList() ??
                                    [])
                                .take(8)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: casts.length,
                              itemBuilder: (context, castsIndex) {
                                final castsItem = casts[castsIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: CastCardWidget(
                                    key: Key(
                                        'Keywio_${castsIndex}_of_${casts.length}'),
                                    image: valueOrDefault<String>(
                                      'https://media.themoviedb.org/t/p/w138_and_h175_face/${getJsonField(
                                        castsItem,
                                        r'''$.profile_path''',
                                      ).toString()}',
                                      'https://media.themoviedb.org/t/p/w138_and_h175_face/ut7ewXjdgUmgkhJ1EtbOo9tbc7s.jpg',
                                    ),
                                    name: getJsonField(
                                      castsItem,
                                      r'''$.original_name''',
                                    ).toString(),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 230.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: FutureBuilder<ApiCallResponse>(
                      future: MovieReviewsCall.call(
                        movieId: widget.movieid,
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
                        final listViewMovieReviewsResponse = snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final reviews = (MovieReviewsCall.results(
                                      listViewMovieReviewsResponse.jsonBody,
                                    )?.toList() ??
                                    [])
                                .take(4)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: reviews.length,
                              itemBuilder: (context, reviewsIndex) {
                                final reviewsItem = reviews[reviewsIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: ReviewCardWidget(
                                    key: Key(
                                        'Keyy5s_${reviewsIndex}_of_${reviews.length}'),
                                    image: valueOrDefault<String>(
                                      'https://media.themoviedb.org/t/p/w45_and_h45_face${getJsonField(
                                        reviewsItem,
                                        r'''$.author_details.avatar_path''',
                                      ).toString()}',
                                      'https://media.themoviedb.org/t/p/w45_and_h45_face/vNPHnw6jgbERZmhNlDk3OwL9KgH.jpg',
                                    ),
                                    name: getJsonField(
                                      reviewsItem,
                                      r'''$.author''',
                                    ).toString(),
                                    review: getJsonField(
                                      reviewsItem,
                                      r'''$.content''',
                                    ).toString(),
                                    rating: getJsonField(
                                      reviewsItem,
                                      r'''$.author_details.rating''',
                                    ),
                                    duration: getJsonField(
                                      reviewsItem,
                                      r'''$.updated_at''',
                                    ).toString(),
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
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
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: FutureBuilder<ApiCallResponse>(
                      future: SimilarMoviesCall.call(
                        movieId: widget.movieid,
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
                        final listViewSimilarMoviesResponse = snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final similarMovies = (SimilarMoviesCall.results(
                                      listViewSimilarMoviesResponse.jsonBody,
                                    )?.toList() ??
                                    [])
                                .take(12)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: similarMovies.length,
                              itemBuilder: (context, similarMoviesIndex) {
                                final similarMoviesItem =
                                    similarMovies[similarMoviesIndex];
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
                                        'movieDetailsPage',
                                        queryParameters: {
                                          'movieid': serializeParam(
                                            getJsonField(
                                              similarMoviesItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: Key(
                                          'Keyn35_${similarMoviesIndex}_of_${similarMovies.length}'),
                                      image: valueOrDefault<String>(
                                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${getJsonField(
                                          similarMoviesItem,
                                          r'''$.poster_path''',
                                        ).toString()}',
                                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                      ),
                                      title: getJsonField(
                                        similarMoviesItem,
                                        r'''$.title''',
                                      ).toString(),
                                      rating: getJsonField(
                                        similarMoviesItem,
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 16.0),
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
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: FutureBuilder<ApiCallResponse>(
                      future: RecommendationMovieCall.call(
                        movieId: widget.movieid,
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
                        final listViewRecommendationMovieResponse =
                            snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final recommendationMovies =
                                (RecommendationMovieCall.results(
                                          listViewRecommendationMovieResponse
                                              .jsonBody,
                                        )?.toList() ??
                                        [])
                                    .take(12)
                                    .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: recommendationMovies.length,
                              itemBuilder:
                                  (context, recommendationMoviesIndex) {
                                final recommendationMoviesItem =
                                    recommendationMovies[
                                        recommendationMoviesIndex];
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
                                        'movieDetailsPage',
                                        queryParameters: {
                                          'movieid': serializeParam(
                                            getJsonField(
                                              recommendationMoviesItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: Key(
                                          'Keyr7l_${recommendationMoviesIndex}_of_${recommendationMovies.length}'),
                                      image: valueOrDefault<String>(
                                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${getJsonField(
                                          recommendationMoviesItem,
                                          r'''$.poster_path''',
                                        ).toString()}',
                                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                      ),
                                      title: getJsonField(
                                        recommendationMoviesItem,
                                        r'''$.title''',
                                      ).toString(),
                                      rating: getJsonField(
                                        recommendationMoviesItem,
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
            ),
          ),
        );
      },
    );
  }
}
