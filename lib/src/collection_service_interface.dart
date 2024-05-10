//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: invalid_use_of_visible_for_testing_member

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class CollectionServiceInterface<T extends Model>
    extends DataServiceInterface<Iterable<T>> {
  //
  //
  //

  /// The reference to the collection.
  final DataRef ref;

  /// The results will be sorted in ascending order by this field.
  final Object? ascendByField;

  /// The results will be sorted in descending order by this field.
  final Object? descendByField;

  //
  //
  //

  CollectionServiceInterface({
    required super.serviceEnvironment,
    required this.ref,
    this.ascendByField,
    this.descendByField,
    super.limit,
  }) {
    assert(
      this.ascendByField == null || this.descendByField == null,
      'ascendByField and descendByField cannot both be set.',
    );
  }

  //
  //
  //

  @override
  DataRef databaseRef() => this.ref;

  //
  //
  //

  @override
  Stream<Iterable<T>> stream([int? limit]) {
    final stream = this.serviceEnvironment.databaseQueryBroker.streamModelCollection(
          this.databaseRef(),
          ascendByField: this.ascendByField,
          descendByField: this.descendByField,
          limit: limit,
        );
    final models = stream.map(
      (e) => e.map((e) => letAs<T>(this.fromJson(e?.data ?? {}))).nonNulls,
    );
    return models;
  }
}
