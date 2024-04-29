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

  Stream<Iterable<ModelUserPub>> streamUserPubsByNameOrEmailQuery({
    required DatabaseServiceInterface databaseServiceBroker,
    required String nameOrEmailQuery,
    int limit = 10,
  });

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

  Stream<Iterable<ModelUserPub>> streamUserPubsByEmails({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> emails,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForAnyMembers({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> memberPids,
    int limit = 10,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> streamRelationshipsForAllMembers({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> memberPids,
    int limit = 10,
  });

  //
  //
  //

  @visibleForTesting
  Future<Iterable<BatchOperation>> getLazyDeleteCollectionOperations({
    required DatabaseServiceInterface databaseServiceBroker,
    required DataRef collectionRef,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelUser>> streamUsersByPids({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> pids,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelOrganization>> streamOrganizationsByPids({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> pids,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelProject>> streamProjectsByPids({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> pids,
  }) {
    throw UnimplementedError();
  }

  //
  //
  //

  Stream<Iterable<ModelJob>> streamJobsByPids({
    required DatabaseServiceInterface databaseServiceBroker,
    required Set<String> pids,
  }) {
    throw UnimplementedError();
  }
}
