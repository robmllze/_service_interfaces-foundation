//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/foundation.dart' show visibleForTesting;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class DatabaseQueryInterface {
  //
  //
  //

  Future<Iterable<ModelUserPub>> queryUserPubsByNameOrEmail({
    required DatabaseServiceInterface databaseServiceBroker,
    required String nameOrEmailQuery,
    int limit = 10,
  });

  //
  //
  //

  Stream<Iterable<ModelUserPub>> streamUserPubsByEmail({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> emails,
  });

  //
  //
  //

  Future<ModelUserPub?> queryUserPubByEmail({
    required DatabaseServiceInterface databaseServiceBroker,
    required String email,
  }) async {
    final stream = this.streamUserPubsByEmail(
      databaseServiceBroker: databaseServiceBroker,
      emails: {email},
    );
    final first = await (stream.first);
    final result = first.firstOrNull;
    return result;
  }

  //
  //
  //

  Stream<Iterable<ModelUserPub>> streamUserPubsByPids({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> pids,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForAnyMembers({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> memberPids,
    int maxRelationshipsPerMember = 10,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForAllMembers({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> memberPids,
    int maxRelationshipsPerMember = 10,
  });

  //
  //
  //

  /// Deletes a collection from the database using a lazy method, not intended
  /// for production use.
  @visibleForTesting
  Future<Iterable<BatchOperation>> getLazyDeleteCollectionOperations({
    required DatabaseServiceInterface databaseServiceBroker,
    required DataRef collectionRef,
  }) {
    throw UnimplementedError();
  }
}
