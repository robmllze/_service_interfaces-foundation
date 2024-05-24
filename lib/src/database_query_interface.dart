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

abstract class DatabaseQueryInterface {
  //
  //
  //

  /// Streams a single model from the database.
  ///
  /// ### Parameters:
  ///
  /// - `ref`: The reference to the document or table where the model should
  /// be streamed.
  /// - `onUpdate`: A callback function to be invoked when the model changes.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  Stream<DataModel?> streamModel(
    DataRef ref, [
    Future<void> Function(DataModel? model)? onUpdate,
  ]) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// Streams a collection of model from the database.
  ///
  /// - `ref`: The reference to the collection or table where the collection
  /// should be streamed.
  /// - `onUpdate` A callback function to be invoked when the collection changes.
  /// - `limit` The maximum number of model to be streamed.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  Stream<Iterable<DataModel?>> streamModelCollection(
    DataRef ref, {
    Future<void> Function(Iterable<DataModel?> model)? onUpdate,
    Object? ascendByField,
    Object? descendByField,
    int? limit,
  }) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

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
