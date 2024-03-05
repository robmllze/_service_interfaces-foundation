//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev 
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
// 
// Licensing details can be found in the LICENSE file in the root directory.
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

  int limit;
  final DataRef ref;

  //
  //
  //

  CollectionServiceInterface({
    required super.serviceEnvironment,
    required this.ref,
    required this.limit,
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
        .databaseServiceBroker
        .streamModelCollection(this.databaseRef(), limit: this.limit);
    final models = data.map(
        (e) => e.map((e) => letAs<T>(this.fromJson(e?.data ?? {}))).nonNulls,);
    return models;
  }
}