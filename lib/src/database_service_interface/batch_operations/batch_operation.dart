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

class BatchOperation<TModel extends Model> extends Equatable {
  //
  //
  //

  final DataRef? ref;
  final TModel? model;
  final bool create;
  final bool read;
  final bool update;
  final bool delete;

  //
  //
  //

  const BatchOperation({
    this.ref,
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
    DataRef? ref,
    TModel? model,
    bool? create,
    bool? read,
    bool? update,
    bool? delete,
  }) {
    return BatchOperation(
      ref: ref ?? this.ref,
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
    ServiceEnvironment serviceEnvironment, [
    TModel? Function(Model?)? convert,
  ]) {
    return [this].execute(serviceEnvironment).then((value) => value.firstOrNull);
  }

  //
  //
  //

  @override
  List<Object?> get props => [
        ref,
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