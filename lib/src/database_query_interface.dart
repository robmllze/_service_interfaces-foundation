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
    required DatabaseServiceInterface databaseService,
    required String nameOrEmailQuery,
    int limit = 10,
  });

  //
  //
  //

  // Future<ModelUserPub?> queryUserByEmail({
  //   required DatabaseServiceInterface databaseService,
  //   required String email,
  // });

  //
  //
  //

  Stream<Iterable<ModelUserPub>> queryUserPubsById({
    required DatabaseServiceInterface databaseService,
    required Set<String> userpubIds,
    int limit = 1000,
  });

  //
  //
  //

  Stream<Iterable<ModelRelationship>> queryRelationshipsForMembers({
    required DatabaseServiceInterface databaseService,
    required Set<String> memberIds,
    int limit = 1000,
  });

  //
  //
  //

  @visibleForTesting
  Future<void> deleteCollectionTest({
    required DatabaseServiceInterface<Model> databaseService,
    required DataRef collectionRef,
  });
}
