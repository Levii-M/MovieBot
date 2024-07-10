import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'section_title_model.dart';
export 'section_title_model.dart';

class SectionTitleWidget extends StatefulWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<SectionTitleWidget> createState() => _SectionTitleWidgetState();
}

class _SectionTitleWidgetState extends State<SectionTitleWidget> {
  late SectionTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionTitleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            valueOrDefault<String>(
              widget.title,
              'Cast',
            ),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
