import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'favorites_card_model.dart';
export 'favorites_card_model.dart';

class FavoritesCardWidget extends StatefulWidget {
  const FavoritesCardWidget({
    super.key,
    this.image,
    this.timestamp,
    this.title,
    this.releasedYear,
    this.genre,
    this.duration,
    this.rating,
    this.numOfVotes,
  });

  final String? image;
  final DateTime? timestamp;
  final String? title;
  final String? releasedYear;
  final String? genre;
  final String? duration;
  final double? rating;
  final String? numOfVotes;

  @override
  State<FavoritesCardWidget> createState() => _FavoritesCardWidgetState();
}

class _FavoritesCardWidgetState extends State<FavoritesCardWidget> {
  late FavoritesCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
