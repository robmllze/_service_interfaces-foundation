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

  /// Creates a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model` is the model data to be set.
  /// - `ref` is the reference to the document or table where the model should be set.
  Future<void> createModel(
    Model model,
    DataRef ref,
  );

  //
  //
  //

  /// Creates or updates (sets) a model on the database.
  ///
  /// ### Parameters:
  ///
  /// - `model` is the model data to be set.
  /// - `ref` is the reference to the document or table where the model should be set.
  Future<void> setModel(
    Model model,
    DataRef ref,
  );

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
  /// - `ref`: The reference to the document or table where the model should
  /// be updated.
  ///
  /// ### NB:
  ///
  /// When overriding, ensure this method throws an error if the model does
  /// not exist!
  Future<void> updateModel(
    Model model,
    DataRef ref,
  );

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
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  Future<void> runTransaction(
    Future<void> Function(dynamic transaction) transactionHandler,
  ) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// Performs a series of batch operations on the database.
  ///
  /// ### Parameters:
  ///
  /// - `writes`: A list of batch operations to execute.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  Future<Iterable<Model?>> runBatchOperations(
    Iterable<BatchOperation> operations,
  ) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }
}
