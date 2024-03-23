//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class DatabaseServiceInterface<TModel extends Model> {
  //
  //
  //

  /// Sets a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model` is the model data to be set.
  /// - `ref` is the reference to the document or table where the model should be set.
  Future<void> setModel(
    TModel model,
    DataRef ref,
  );

  //
  //
  //

  /// Updates a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model`: The updated model.
  /// - `ref`: The reference to the document or table where the model should
  /// be updated.
  ///
  /// ### NB:
  ///
  /// When overriding, ensure this method throws an error if the model does
  /// not exist!
  Future<void> updateModel(
    TModel model,
    DataRef ref,
  );

  //
  //
  //

  /// Retrieves a model from the database.
  ///
  /// ### Parameters:
  ///
  /// - `ref`: The reference to the document or table where the model should
  /// be retrieved.
  Future<GenericModel?> getModel(DataRef ref);

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
  /// - `transactionHandler`: A function that handles the transaction logic.
  Future<void> runTransaction(
    Future<void> Function(dynamic) transactionHandler,
  );

  //
  //
  //

  /// Performs a batch write operation in the database.
  ///
  /// ### Parameters:
  ///
  /// - `writes`: A list of write operations to be executed in a batch.
  Future<void> batchWrite(
    Iterable<BatchWriteOperation<TModel>> writes,
  );

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
  Stream<GenericModel?> streamModel(
    DataRef ref, [
    Future<void> Function(GenericModel?)? onUpdate,
  ]);

  //
  //
  //

  /// Streams a collection of model from the database.
  ///
  /// - `ref`: The reference to the collection or table where the collection
  /// should be streamed.
  /// - `onUpdate` A callback function to be invoked when the collection changes.
  /// - `limit` The maximum number of model to be streamed.
  Stream<Iterable<GenericModel?>> streamModelCollection(
    DataRef ref, {
    Future<void> Function(Iterable<GenericModel?>)? onUpdate,
    int limit = 1000,
  });
}
