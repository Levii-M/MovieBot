import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'search_text_model.dart';
export 'search_text_model.dart';

class SearchTextWidget extends StatefulWidget {
  const SearchTextWidget({super.key});

  @override
  State<SearchTextWidget> createState() => _SearchTextWidgetState();
}

class _SearchTextWidgetState extends State<SearchTextWidget> {
  late SearchTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.search,
          color: FlutterFlowTheme.of(context).primary,
          size: 68.0,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'Search in MovieBot',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Text(
            'By typing in the search box, MovieBot will search for movies and TV shows and then show you the best results.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
