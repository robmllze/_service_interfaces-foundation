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

  Stream<Iterable<ModelUserPub>> queryUserPubsByEmail({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> emails,
    int limit = 1000,
  });

  //
  //
  //

  Future<ModelUserPub?> queryUserPubByEmail({
    required DatabaseServiceInterface databaseServiceBroker,
    required String email,
  }) async {
    final stream = this.queryUserPubsByEmail(
      databaseServiceBroker: databaseServiceBroker,
      emails: {email},
      limit: 1,
    );
    final first = await (stream.first);
    final result = first.firstOrNull;
    return result;
  }

  //
  //
  //

  Stream<Iterable<ModelUserPub>> queryUserPubsById({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> pids,
    int limit = 1000,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> queryRelationshipsForMembers({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> memberPids,
    int limit = 1000,
  });

  //
  //
  //

  /// Deletes a collection from the database using a lazy method, not intended
  /// for production use.
  @visibleForTesting
  Future<Iterable<BatchWriteOperation>> getLazyDeleteCollectionOperations({
    required DatabaseServiceInterface databaseServiceBroker,
    required DataRef collectionRef,
  }) {
    throw UnimplementedError();
  }

  
}
