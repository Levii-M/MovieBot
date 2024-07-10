import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tv_shows_big_card_model.dart';
export 'tv_shows_big_card_model.dart';

class TvShowsBigCardWidget extends StatefulWidget {
  const TvShowsBigCardWidget({
    super.key,
    this.image,
    this.title,
    this.lastAirEpisode,
    this.genre,
    this.nomOfSeasons,
    this.rating,
    this.numOfVotes,
  });

  final String? image;
  final String? title;
  final String? lastAirEpisode;
  final String? genre;
  final int? nomOfSeasons;
  final double? rating;
  final int? numOfVotes;

  @override
  State<TvShowsBigCardWidget> createState() => _TvShowsBigCardWidgetState();
}

class _TvShowsBigCardWidgetState extends State<TvShowsBigCardWidget> {
  late TvShowsBigCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TvShowsBigCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.image!,
              width: double.infinity,
              height: 400.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  FlutterFlowTheme.of(context).primaryBackground
                ],
                stops: const [0.0, 1.0],
                begin: const AlignmentDirectional(0.0, -1.0),
                end: const AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 400.0,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.title,
                              'Title',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.lastAirEpisode,
                                    'last Episode',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Container(
                                    width: 6.0,
                                    height: 6.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0x32FFFFFF),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    '${valueOrDefault<String>(
                                      widget.nomOfSeasons?.toString(),
                                      'Number of seasons',
                                    )}Seasons',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.genre,
                                    'genre',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star,
                                color: FlutterFlowTheme.of(context).warning,
                                size: 16.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 4.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.rating?.toString(),
                                    'rating',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.numOfVotes?.toString(),
                                  'number of votes',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: const BoxDecoration(
                color: Color(0xB314181B),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('homePage');
                },
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.9, 0.3),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await TvShowsFavoritesRecord.createDoc(currentUserReference!)
                    .set(createTvShowsFavoritesRecordData(
                  posterPath: widget.image,
                  lastAirEpisode: widget.lastAirEpisode,
                  genre: '',
                  rating: widget.rating,
                  numOfVotes: widget.numOfVotes,
                  numOfEpisode: widget.nomOfSeasons,
                ));
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await TvShowsFavoritesRecord.createDoc(
                            currentUserReference!)
                        .set(createTvShowsFavoritesRecordData(
                      posterPath: widget.image,
                      title: widget.title,
                      lastAirEpisode: widget.lastAirEpisode,
                      numOfEpisode: widget.nomOfSeasons,
                      genre: widget.genre,
                      rating: widget.rating,
                      numOfVotes: widget.numOfVotes,
                      createdAt: getCurrentTimestamp,
                    ));
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content: const Text('Tv Show is Added to Favorites'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.favorite,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
