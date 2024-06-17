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

/// Provides a unified interface for managing database transactions.
///
/// This interface supports basic transaction operations like merging,
/// overwriting, creating, reading, updating, and deleting data models.
abstract class TransactionInterface {
  //
  //
  //

  const TransactionInterface();

  //
  //
  //

  /// Merges a [model] into the transaction.
  void merge(Model model);

  //
  //
  //

  /// Overwrites a [model] in the transaction.
  void overwrite(Model model);

  //
  //
  //

  /// Creates a new [model] in the transaction.
  void create(Model model);

  //
  //
  //

  /// Reads a model from the transaction.
  ///
  /// - [ref] The Reference to the model.
  /// - [fromJsonOrNull] A function that converts the model data to a model instance.
  ///
  /// Returns the model instance if it exists, otherwise `null`.
  Future<TModel?> read<TModel extends Model>(
    DataRef ref,
    TFromJsonOrNull<TModel> fromJsonOrNull,
  );

  //
  //
  //

  /// Updates a [model] in the transaction.
  void update(Model model);

  //
  //
  //

  /// Deletes a model from the transaction using its [ref].
  void delete(DataRef ref);

  //
  //
  //

  /// Commits the transaction.
  @protected
  Future<List<Model>> commit();

  //
  //
  //

  /// Discards the transaction, effectively clearing all pending operations.
  Future<void> discard();
}
