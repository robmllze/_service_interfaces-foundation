//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/../_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Represents a database batch operation.
base class BatchOperation<TModel extends Model> extends Equatable {
  //
  //
  //

  final TModel? model;
  final bool create;
  final bool read;
  final bool update;
  final bool delete;

  //
  //
  //

  const BatchOperation({
    this.model,
    required this.create,
    required this.read,
    required this.update,
    required this.delete,
  });

  //
  //
  //

  BatchOperation<TModel> copyWith({
    TModel? model,
    bool? create,
    bool? read,
    bool? update,
    bool? delete,
  }) {
    return BatchOperation(
      model: model ?? this.model,
      create: create ?? this.create,
      read: read ?? this.read,
      update: update ?? this.update,
      delete: delete ?? this.delete,
    );
  }

  //
  //
  //

  Future<TModel?> execute(
    dynamic serviceEnvironment, [
    TModel? Function(Model?)? convert,
  ]) {
    return [this].execute(serviceEnvironment).then((value) => value.firstOrNull);
  }

  //
  //
  //

  @override
  List<Object?> get props => [
        model,
        delete,
        update,
        create,
      ];
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension ExecuteOnBatchOperationIterableExtension<TModel extends Model>
    on Iterable<BatchOperation<TModel>> {
  //
  //
  //

  Future<Iterable<TModel?>> execute(
    ServiceEnvironment serviceEnvironment, [
    TModel? Function(Model?)? convert,
  ]) async {
    var models = await serviceEnvironment.databaseServiceBroker.runBatchOperations(this);
    if (convert != null) {
      models = models.map((model) => model != null ? convert(model) : model);
    }
    return models.cast();
  }
}
