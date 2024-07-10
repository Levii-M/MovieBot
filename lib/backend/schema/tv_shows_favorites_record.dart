import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TvShowsFavoritesRecord extends FirestoreRecord {
  TvShowsFavoritesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "poster_path" field.
  String? _posterPath;
  String get posterPath => _posterPath ?? '';
  bool hasPosterPath() => _posterPath != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "lastAirEpisode" field.
  String? _lastAirEpisode;
  String get lastAirEpisode => _lastAirEpisode ?? '';
  bool hasLastAirEpisode() => _lastAirEpisode != null;

  // "numOfEpisode" field.
  int? _numOfEpisode;
  int get numOfEpisode => _numOfEpisode ?? 0;
  bool hasNumOfEpisode() => _numOfEpisode != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "numOfVotes" field.
  int? _numOfVotes;
  int get numOfVotes => _numOfVotes ?? 0;
  bool hasNumOfVotes() => _numOfVotes != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _posterPath = snapshotData['poster_path'] as String?;
    _title = snapshotData['title'] as String?;
    _lastAirEpisode = snapshotData['lastAirEpisode'] as String?;
    _numOfEpisode = castToType<int>(snapshotData['numOfEpisode']);
    _genre = snapshotData['genre'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _numOfVotes = castToType<int>(snapshotData['numOfVotes']);
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('TvShows_Favorites')
          : FirebaseFirestore.instance.collectionGroup('TvShows_Favorites');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('TvShows_Favorites').doc(id);

  static Stream<TvShowsFavoritesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TvShowsFavoritesRecord.fromSnapshot(s));

  static Future<TvShowsFavoritesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TvShowsFavoritesRecord.fromSnapshot(s));

  static TvShowsFavoritesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TvShowsFavoritesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TvShowsFavoritesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TvShowsFavoritesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TvShowsFavoritesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TvShowsFavoritesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTvShowsFavoritesRecordData({
  String? posterPath,
  String? title,
  String? lastAirEpisode,
  int? numOfEpisode,
  String? genre,
  double? rating,
  int? numOfVotes,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'poster_path': posterPath,
      'title': title,
      'lastAirEpisode': lastAirEpisode,
      'numOfEpisode': numOfEpisode,
      'genre': genre,
      'rating': rating,
      'numOfVotes': numOfVotes,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TvShowsFavoritesRecordDocumentEquality
    implements Equality<TvShowsFavoritesRecord> {
  const TvShowsFavoritesRecordDocumentEquality();

  @override
  bool equals(TvShowsFavoritesRecord? e1, TvShowsFavoritesRecord? e2) {
    return e1?.posterPath == e2?.posterPath &&
        e1?.title == e2?.title &&
        e1?.lastAirEpisode == e2?.lastAirEpisode &&
        e1?.numOfEpisode == e2?.numOfEpisode &&
        e1?.genre == e2?.genre &&
        e1?.rating == e2?.rating &&
        e1?.numOfVotes == e2?.numOfVotes &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(TvShowsFavoritesRecord? e) => const ListEquality().hash([
        e?.posterPath,
        e?.title,
        e?.lastAirEpisode,
        e?.numOfEpisode,
        e?.genre,
        e?.rating,
        e?.numOfVotes,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is TvShowsFavoritesRecord;
}
