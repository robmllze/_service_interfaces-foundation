//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/@interfaces/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class DatabaseQueryInterface {
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
