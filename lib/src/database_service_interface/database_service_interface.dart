//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:xyz_pod/_common.dart';

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
  Future<void> createOrUpdateModel(
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
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  Stream<GenericModel?> streamModel(
    DataRef ref, [
    Future<void> Function(GenericModel? model)? onUpdate,
  ]) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// Streams a collection of model from the database.
  ///
  /// - `ref`: The reference to the collection or table where the collection
  /// should be streamed.
  /// - `onUpdate` A callback function to be invoked when the collection changes.
  /// - `limit` The maximum number of model to be streamed.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  Stream<Iterable<GenericModel?>> streamModelCollection(
    DataRef ref, {
    Future<void> Function(Iterable<GenericModel?> model)? onUpdate,
    int limit = 1000,
  }) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// A value to be set on a model field that would delete the field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic deleteFieldValue() {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// A value to be set on a model field that would increment the field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic incremementFieldValue([int i = 1]) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// A value to be set on a model field that would decrement the field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic decrementFieldValue([int i = 1]) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }
  //
  //
  //

  /// A value to be set on a model field that would add elements to a list field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic arrayUnionFieldValue(List elementsToAdd) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// A value to be set on a model field that would remove elements from a list field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic arrayRemoveFieldValue(List elementsToRemove) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }
}
