import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'movie_card_model.dart';
export 'movie_card_model.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
  });

  final String? image;
  final String? title;
  final double? rating;

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  late MovieCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.0,
      height: 224.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.network(
              widget.image!,
              width: double.infinity,
              height: 172.0,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.title,
                  'title',
                ),
                textAlign: TextAlign.start,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.star,
                  color: FlutterFlowTheme.of(context).warning,
                  size: 16.0,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.rating?.toString(),
                    '4.8',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
