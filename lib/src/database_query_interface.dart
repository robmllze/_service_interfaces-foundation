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

abstract class DatabaseQueryInterface<TDatabaseServiceInterface extends DatabaseServiceInterface> {
  //
  //
  //

  final TDatabaseServiceInterface databaseServiceBroker;

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
    required String nameOrEmailQuery,
    int? limit = 10,
  });

  //
  //
  //

  Stream<Iterable<T>> streamByWhereInElements<T>({
    required Iterable<String> elements,
    required DataRef collectionRef,
    required T? Function(Map<String, dynamic>? otherData) fromJsonOrNull,
    required Set<String> elementKeys,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForAnyMembers({
    required Iterable<String> pids,
    int? limit,
    Iterable<RelationshipDefType> defTypes = const {},
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForAllMembers({
    required Iterable<String> pids,
    int? limit,
    Iterable<RelationshipDefType> defTypes = const {},
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

  //
  //
  //

  Stream<Iterable<ModelUser>> streamUsersByPids({
    required Iterable<String> pids1,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelOrganization>> streamOrganizationsByPids({
    required Iterable<String> pids1,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelProject>> streamProjectsByPids({
    required Iterable<String> pids1,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelJob>> streamJobsByPids({
    required Iterable<String> pids1,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelFileEntry>> streamFileByCreatorId({
    required Set<String> createdByAny,
    int? limit,
  });
}
