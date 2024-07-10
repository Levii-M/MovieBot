import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/episode_card/episode_card_widget.dart';
import 'package:flutter/material.dart';
import 'episodes_model.dart';
export 'episodes_model.dart';

class EpisodesWidget extends StatefulWidget {
  const EpisodesWidget({
    super.key,
    required this.tvid,
    required this.seasonNumber,
    required this.tvShowName,
  });

  final int? tvid;
  final int? seasonNumber;
  final String? tvShowName;

  @override
  State<EpisodesWidget> createState() => _EpisodesWidgetState();
}

class _EpisodesWidgetState extends State<EpisodesWidget> {
  late EpisodesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EpisodesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
              child: Container(
                width: 60.0,
                height: 6.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.tvShowName,
                      'TvShowName',
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Text(
                      '->',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Text(
                    'Episodes',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            FutureBuilder<ApiCallResponse>(
              future: TvSeasonsCall.call(
                tvId: widget.tvid,
                seasonNumber: widget.seasonNumber,
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
                final listViewTvSeasonsResponse = snapshot.data!;

                return Builder(
                  builder: (context) {
                    final episodes = TvSeasonsCall.episodes(
                          listViewTvSeasonsResponse.jsonBody,
                        )?.toList() ??
                        [];

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: episodes.length,
                      itemBuilder: (context, episodesIndex) {
                        final episodesItem = episodes[episodesIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 24.0, 8.0),
                          child: EpisodeCardWidget(
                            key: Key(
                                'Keymn2_${episodesIndex}_of_${episodes.length}'),
                            image:
                                'https://media.themoviedb.org/t/p/w227_and_h127_bestv2/${getJsonField(
                              episodesItem,
                              r'''$.still_path''',
                            ).toString()}',
                            episode: 'Episode ${getJsonField(
                              episodesItem,
                              r'''$.episode_number''',
                            ).toString()}',
                            name: getJsonField(
                              episodesItem,
                              r'''$.name''',
                            ).toString(),
                            duration: '${getJsonField(
                              episodesItem,
                              r'''$.runtime''',
                            ).toString()} m',
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
