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

abstract class FunctionsServiceInterface {
  //
  //
  //

  final String region;
  final String projectId;
  final AuthServiceInterface authServiceBroker;

  //
  //
  //

  FunctionsServiceInterface({
    required this.region,
    required this.projectId,
    required this.authServiceBroker,
  });

  //
  //
  //

  Uri functionsEndpointUrl(String functionId);

  //
  //
  //

  Future<bool> deleteCollection(String collectionPath) async {
    final (_, success) = await callDeleteCollectionFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      collectionPath: collectionPath,
    );
    return success;
  }
}
