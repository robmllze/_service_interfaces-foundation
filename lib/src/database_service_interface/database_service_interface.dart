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

abstract class DatabaseServiceInterface {
  //
  //
  //

  const DatabaseServiceInterface();

  //
  //
  //

  /// Streams a single model from the database.
  ///
  /// ### Parameters:
  ///
  /// - `ref`: The reference to the document or table where the model should
  /// be streamed.
  @visibleForTesting
  Stream<TModel?> streamModel<TModel extends Model>(
    DataRef ref,
    TModel? Function(Map<String, dynamic>? data) fromJsonOrNull,
  );

  //
  //
  //

  /// Streams a collection of model from the database.
  ///
  /// - `ref`: The reference to the collection or table where the collection
  /// should be streamed.
  /// - `limit` The maximum number of model to be streamed.
  Stream<Iterable<TModel?>> streamModelCollection<TModel extends Model>(
    DataRef ref,
    TModel? Function(Map<String, dynamic>? data) fromJsonOrNull, {
    Object? ascendByField,
    Object? descendByField,
    int? limit,
  });

  //
  //
  //

  /// Creates a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model` is the model data to be set.
  /// - `model.ref` is the reference to the document or table where the model
  /// should be set.
  Future<void> createModel<TModel extends Model>(TModel model);

  //
  //
  //

  /// Creates or updates (sets) a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model` is the model data to be set.
  /// - `model.ref` is the reference to the document or table where the model
  /// should be set.
  Future<void> setModel<TModel extends Model>(TModel model);

  //
  //
  //

  /// Reads a model from the database.
  ///
  /// ### Parameters:
  ///
  /// - `ref`: The reference to the document or table where the model should
  /// be retrieved.
  Future<TModel?> readModel<TModel extends Model>(
    DataRef ref,
    TModel? Function(Map<String, dynamic>? data) fromJsonOrNull,
  );

  //
  //
  //

  /// Updates a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model`: The updated model.
  /// - `model.ref`: The reference to the document or table where the model
  /// should be updated.
  ///
  /// ### NB:
  ///
  /// When overriding, ensure this method throws an error if the model does
  /// not exist!
  Future<void> updateModel<TModel extends Model>(TModel model);

  //
  //
  //

  /// Deletes a model from the database.
  ///
  /// ### Parameters:
  ///
  /// - `ref`: The reference to the document or table where the model should
  /// be deleted.
  Future<void> deleteModel(DataRef ref);

  //
  //
  //

  /// Initiates a transaction in the database.
  ///
  /// ### Parameters:
  ///
  /// - `broker`: A function that handles the transaction logic.
  Future<void> runTransaction(
    Future<void> Function(TransactionInterface broker) transactionHandler,
  );

  //
  //
  //

  /// Performs a series of batch operations on the database.
  ///
  /// ### Parameters:
  ///
  /// - `operations`: A list of batch operations to execute.
  Future<Iterable<TModel?>> runBatchOperations<TModel extends Model>(
    Iterable<BatchOperation<TModel>> operations,
  );
}
