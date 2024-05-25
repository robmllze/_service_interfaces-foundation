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

  /// Creates a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model` is the model data to be set.
  /// - `model.ref` is the reference to the document or table where the model
  /// should be set.
  Future<void> createModel(Model model);

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
  Future<void> setModel(Model model);

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
    DataRef ref, [
    TModel? Function(Model? model)? convert,
  ]);

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
  Future<void> updateModel(Model model);

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
  Future<Iterable<Model?>> runBatchOperations(
    Iterable<BatchOperation> operations,
  );
}
