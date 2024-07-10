import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovieFavoritesRecord extends FirestoreRecord {
  MovieFavoritesRecord._(
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

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "released_year" field.
  String? _releasedYear;
  String get releasedYear => _releasedYear ?? '';
  bool hasReleasedYear() => _releasedYear != null;

  // "NumOfVotes" field.
  String? _numOfVotes;
  String get numOfVotes => _numOfVotes ?? '';
  bool hasNumOfVotes() => _numOfVotes != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _posterPath = snapshotData['poster_path'] as String?;
    _title = snapshotData['title'] as String?;
    _genre = snapshotData['genre'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _duration = snapshotData['duration'] as String?;
    _releasedYear = snapshotData['released_year'] as String?;
    _numOfVotes = snapshotData['NumOfVotes'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('movie_favorites')
          : FirebaseFirestore.instance.collectionGroup('movie_favorites');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('movie_favorites').doc(id);

  static Stream<MovieFavoritesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MovieFavoritesRecord.fromSnapshot(s));

  static Future<MovieFavoritesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MovieFavoritesRecord.fromSnapshot(s));

  static MovieFavoritesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MovieFavoritesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MovieFavoritesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MovieFavoritesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MovieFavoritesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MovieFavoritesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMovieFavoritesRecordData({
  String? posterPath,
  String? title,
  String? genre,
  double? rating,
  String? duration,
  String? releasedYear,
  String? numOfVotes,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'poster_path': posterPath,
      'title': title,
      'genre': genre,
      'rating': rating,
      'duration': duration,
      'released_year': releasedYear,
      'NumOfVotes': numOfVotes,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MovieFavoritesRecordDocumentEquality
    implements Equality<MovieFavoritesRecord> {
  const MovieFavoritesRecordDocumentEquality();

  @override
  bool equals(MovieFavoritesRecord? e1, MovieFavoritesRecord? e2) {
    return e1?.posterPath == e2?.posterPath &&
        e1?.title == e2?.title &&
        e1?.genre == e2?.genre &&
        e1?.rating == e2?.rating &&
        e1?.duration == e2?.duration &&
        e1?.releasedYear == e2?.releasedYear &&
        e1?.numOfVotes == e2?.numOfVotes &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(MovieFavoritesRecord? e) => const ListEquality().hash([
        e?.posterPath,
        e?.title,
        e?.genre,
        e?.rating,
        e?.duration,
        e?.releasedYear,
        e?.numOfVotes,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is MovieFavoritesRecord;
}
