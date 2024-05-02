//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class CollectionServiceInterface<T extends Model>
    extends ModelServiceInterface<Iterable<T>> {
  //
  //
  //

  int? streamLimit;
  final DataRef ref;

  //
  //
  //

  CollectionServiceInterface({
    required super.serviceEnvironment,
    required this.ref,
    required this.streamLimit,
  });

  //
  //
  //

  @override
  DataRef databaseRef() => this.ref;

  //
  //
  //

  @override
  Stream<Iterable<T>> stream() {
    final data = this
        .serviceEnvironment
        .databaseQueryBroker
        .streamModelCollection(this.databaseRef(), limit: this.streamLimit);
    final models = data.map(
      (e) => e.map((e) => letAs<T>(this.fromJson(e?.data ?? {}))).nonNulls,
    );
    return models;
  }
}
