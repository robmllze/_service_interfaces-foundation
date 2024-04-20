//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:equatable/equatable.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BatchWriteOperation<TModel extends Model> extends Equatable {
  //
  //
  //

  final DataRef ref;
  final TModel? model;
  final bool delete;
  final bool mergeExisting;
  final bool overwriteExisting;

  //
  //
  //

  const BatchWriteOperation(
    this.ref, {
    this.model,
    this.delete = false,
    this.mergeExisting = true,
    this.overwriteExisting = true,
  });

  //
  //
  //

  Future<void> write(DatabaseServiceInterface databaseServiceBroker) =>
      [this].batchWrite(databaseServiceBroker);

  //
  //
  //

  @override
  List<Object?> get props => [
        ref,
        model,
        delete,
        mergeExisting,
        overwriteExisting,
      ];
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension BatchWriteOnBatchWriteOperationIterable on Iterable<BatchWriteOperation> {
  //
  //
  //

  Future<void> batchWrite(DatabaseServiceInterface databaseServiceBroker) =>
      databaseServiceBroker.batchWrite(this);
}
