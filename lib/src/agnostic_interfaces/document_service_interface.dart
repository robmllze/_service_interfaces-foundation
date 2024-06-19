//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: invalid_use_of_visible_for_testing_member

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Provides a service interface for streaming and transforming document data
/// into a specified model type.
///
/// Extend this interface to customize the fetching and conversion of document
/// data, tailored to different model types.
abstract base class DocumentServiceInterface<TModel extends Model>
    extends DataServiceInterface<TModel?> {
  //
  //
  //

  final String id;

  //
  //
  //

  DocumentServiceInterface({
    required super.serviceEnvironment,
    required this.id,
  });

  //
  //
  //

  @nonVirtual
  @override
  Stream<TModel?> stream([int? limit]) {
    return this.serviceEnvironment.databaseServiceBroker.streamModel<TModel>(
          this.databaseRef(),
          (e) => this.fromJsonOrNull(e),
        );
  }

  //
  //
  //

  @override
  TModel? fromJsonOrNull(Map<String, dynamic>? data);
}
