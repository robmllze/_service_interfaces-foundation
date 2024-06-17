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

/// Provides a service interface for streaming and transforming data from a
/// collection into an iterable of specified model types.
///
/// Extend this interface to customize the fetching, sorting, and conversion of
/// collection data, tailored to different model types.
abstract base class CollectionServiceInterface<TModel extends Model>
    extends DataServiceInterface<Iterable<TModel>> {
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
  Stream<Iterable<TModel>> stream([int? limit]) {
    return this
        .serviceEnvironment
        .databaseServiceBroker
        .streamModelCollection<TModel>(
          this.databaseRef(),
          (e) => this.fromJsonOrNull(e),
          ascendByField: this.ascendByField,
          descendByField: this.descendByField,
          limit: limit,
        )
        .map((e) => e.nonNulls);
  }
}
