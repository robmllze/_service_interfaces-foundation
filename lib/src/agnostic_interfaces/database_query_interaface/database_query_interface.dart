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

/// Defines the core functionalities of a database querying service.
///
/// This interface ensures that any implementation of the database querying
/// system adheres to the specified methods and behaviors necessary for
/// executing and managing database queries.
///
/// It is designed to be backend-agnostic, allowing for integration with various
/// database system without altering the interface's fundamental operations.
///
/// This flexibility ensures that the application can interact with different
/// database backends, while maintaining consistent query execution and data
/// manipulation methods across various implementations.
abstract base class DatabaseQueryInterface {
  //
  //
  //

  final DatabaseServiceInterface databaseServiceBroker;

  //
  //
  //

  const DatabaseQueryInterface({
    required this.databaseServiceBroker,
  });

  //
  //
  //

  Stream<Iterable<ModelUserPub>> streamUserPubsByNameOrEmailQuery({
    required String partialNameOrEmail,
    int? limit = 10,
  });

  //
  //
  //

  Stream<Iterable<TModel>> streamByWhereInElements<TModel extends Model>({
    required Iterable<String> elements,
    required DataRef collectionRef,
    required TFromJsonOrNull<TModel> fromJsonOrNull,
    required Set<String> elementKeys,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForAnyMember({
    required Iterable<String> memberPids,
    Iterable<RelationshipDefType> defTypes = const {},
    int? limit,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForEveryMember({
    required Iterable<String> memberPids,
    Iterable<RelationshipDefType> defTypes = const {},
    int? limit,
  });

  //
  //
  //

  Stream<Iterable<ModelFileEntry>> streamFilesByCreatorId({
    required Set<String> createdByAny,
    int? limit,
  });

  //
  //
  //

  @visibleForTesting
  Future<Iterable<BatchOperation>> getLazyDeleteCollectionOperations({
    required DataRef collectionRef,
  }) {
    throw UnimplementedError();
  }
}
