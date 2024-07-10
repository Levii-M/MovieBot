import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/movie_card/movie_card_widget.dart';
import '/pages/components/slider_card/slider_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<ApiCallResponse>(
                future: PopularMoviesCall.call(),
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
                  final pageViewPopularMoviesResponse = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      final popularMovies =
                          (PopularMoviesCall.popularMoviesResults(
                                    pageViewPopularMoviesResponse.jsonBody,
                                  )?.toList() ??
                                  [])
                              .take(8)
                              .toList();

                      return SizedBox(
                        width: double.infinity,
                        height: 400.0,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 40.0),
                              child: PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: max(0,
                                            min(0, popularMovies.length - 1))),
                                scrollDirection: Axis.horizontal,
                                itemCount: popularMovies.length,
                                itemBuilder: (context, popularMoviesIndex) {
                                  final popularMoviesItem =
                                      popularMovies[popularMoviesIndex];
                                  return InkWell(
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
                                              popularMoviesItem,
                                              r'''$.id''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: SliderCardWidget(
                                      key: Key(
                                          'Keyd0c_${popularMoviesIndex}_of_${popularMovies.length}'),
                                      image:
                                          'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/${getJsonField(
                                        popularMoviesItem,
                                        r'''$.backdrop_path''',
                                      ).toString()}',
                                      title: getJsonField(
                                        popularMoviesItem,
                                        r'''$.title''',
                                      ).toString(),
                                      genre: 'Genre - genre',
                                    ),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-0.85, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 16.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(0,
                                                  popularMovies.length - 1))),
                                  count: popularMovies.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    setState(() {});
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 2.0,
                                    spacing: 8.0,
                                    radius: 16.0,
                                    dotWidth: 16.0,
                                    dotHeight: 6.0,
                                    dotColor:
                                        FlutterFlowTheme.of(context).accent2,
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).primary,
                                    paintStyle: PaintingStyle.fill,
                                  ),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Now playing Movies',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: NowPlayingCall.call(),
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
                    final listViewNowPlayingResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final nowPlayingMovies =
                            NowPlayingCall.nowPlayingResults(
                                  listViewNowPlayingResponse.jsonBody,
                                )?.toList() ??
                                [];

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: nowPlayingMovies.length,
                          itemBuilder: (context, nowPlayingMoviesIndex) {
                            final nowPlayingMoviesItem =
                                nowPlayingMovies[nowPlayingMoviesIndex];
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
                                          nowPlayingMoviesItem,
                                          r'''$.id''',
                                        ),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: MovieCardWidget(
                                  key: Key(
                                      'Keywfe_${nowPlayingMoviesIndex}_of_${nowPlayingMovies.length}'),
                                  image: valueOrDefault<String>(
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${valueOrDefault<String>(
                                      getJsonField(
                                        nowPlayingMoviesItem,
                                        r'''$.poster_path''',
                                      )?.toString(),
                                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                    )}',
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                  ),
                                  title: getJsonField(
                                    nowPlayingMoviesItem,
                                    r'''$.title''',
                                  ).toString(),
                                  rating: getJsonField(
                                    nowPlayingMoviesItem,
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
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Tv shows',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 224.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                child: FutureBuilder<ApiCallResponse>(
                  future: PopularTvShowsCall.call(),
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
                    final listViewPopularTvShowsResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final popularShows = PopularTvShowsCall.results(
                              listViewPopularTvShowsResponse.jsonBody,
                            )?.toList() ??
                            [];

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: popularShows.length,
                          itemBuilder: (context, popularShowsIndex) {
                            final popularShowsItem =
                                popularShows[popularShowsIndex];
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
                                          popularShowsItem,
                                          r'''$.id''',
                                        ),
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: MovieCardWidget(
                                  key: Key(
                                      'Key0ub_${popularShowsIndex}_of_${popularShows.length}'),
                                  image: valueOrDefault<String>(
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/${valueOrDefault<String>(
                                      getJsonField(
                                        popularShowsItem,
                                        r'''$.poster_path''',
                                      )?.toString(),
                                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                    )}',
                                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg',
                                  ),
                                  title: getJsonField(
                                    popularShowsItem,
                                    r'''$.name''',
                                  ).toString(),
                                  rating: getJsonField(
                                    popularShowsItem,
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
  }
}
