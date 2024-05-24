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

class ServiceEnvironment<
    TAuthServiceInterface extends AuthServiceInterface,
    TDatabaseServiceInterface extends DatabaseServiceInterface,
    TLocalDatabaseServiceInterface extends DatabaseServiceInterface,
    TDatabaseQueryInterface extends DatabaseQueryInterface,
    TFunctionsServiceInterface extends FunctionsServiceInterface,
    TFileServiceInterface extends FileServiceInterface,
    TFieldValueInterface extends FieldValueInterface> {
  //
  //
  //

  late final TAuthServiceInterface? _authServiceBroker;
  late final TDatabaseServiceInterface? _databaseServiceBroker;
  late final TLocalDatabaseServiceInterface? _localDatabaseServiceBroker;
  late final TDatabaseQueryInterface? _databaseQueryBroker;
  late final TFunctionsServiceInterface? _functionsServiceBroker;
  late final TFileServiceInterface? _fileServiceBroker;
  late final TFieldValueInterface? _fieldValueBroker;

  //
  //
  //

  ServiceEnvironment({
    TAuthServiceInterface? authServiceBroker,
    TDatabaseServiceInterface? databaseServiceBroker,
    TLocalDatabaseServiceInterface? localDatabaseServiceBroker,
    TDatabaseQueryInterface? databaseQueryBroker,
    TFunctionsServiceInterface? functionsServiceBroker,
    TFileServiceInterface? fileServiceBroker,
    TFieldValueInterface? fieldValueBroker,
  }) {
    this._authServiceBroker = authServiceBroker;
    this._databaseServiceBroker = databaseServiceBroker;
    this._localDatabaseServiceBroker = localDatabaseServiceBroker;
    this._databaseQueryBroker = databaseQueryBroker;
    this._functionsServiceBroker = functionsServiceBroker;
    this._fileServiceBroker = fileServiceBroker;
    this._fieldValueBroker = fieldValueBroker;
  }

  //
  //
  //

  TAuthServiceInterface get authServiceBroker {
    if (this._authServiceBroker == null) {
      throw UnimplementedError(
        'authServiceBroker is not available in the current environment.',
      );
    }
    return this._authServiceBroker;
  }

  TDatabaseServiceInterface get databaseServiceBroker {
    if (this._databaseServiceBroker == null) {
      throw UnimplementedError(
        'databaseServiceBroker is not available in the current environment.',
      );
    }
    return this._databaseServiceBroker;
  }

  TLocalDatabaseServiceInterface get localDatabaseServiceBroker {
    if (this._localDatabaseServiceBroker == null) {
      throw UnimplementedError(
        'localDatabaseServiceBroker is not available in the current environment.',
      );
    }
    return this._localDatabaseServiceBroker;
  }

  TDatabaseQueryInterface get databaseQueryBroker {
    if (this._databaseQueryBroker == null) {
      throw UnimplementedError(
        'databaseQueryBroker is not available in the current environment.',
      );
    }
    return this._databaseQueryBroker;
  }

  TFunctionsServiceInterface get functionsServiceBroker {
    if (this._functionsServiceBroker == null) {
      throw UnimplementedError(
        'functionsServiceBroker is not available in the current environment.',
      );
    }
    return this._functionsServiceBroker;
  }

  TFileServiceInterface get fileServiceBroker {
    if (this._fileServiceBroker == null) {
      throw UnimplementedError(
        'fileServiceBroker is not available in the current environment.',
      );
    }
    return this._fileServiceBroker;
  }

  TFieldValueInterface get fieldValueBroker {
    if (this._fieldValueBroker == null) {
      throw UnimplementedError(
        'fieldValueBroker is not available in the current environment.',
      );
    }
    return this._fieldValueBroker;
  }

  //
  //
  //

  AuthUser? get currentUser => this.authServiceBroker.pCurrentUser.value;

  //
  //
  //

  static const CURRENT_SERVICE_ENVIRONMENT = String.fromEnvironment('SERVICE_ENVIRONMENT');

  static ServiceEnvironmentType get currentServiceEnvironment {
    return ServiceEnvironmentType.values.valueOf(CURRENT_SERVICE_ENVIRONMENT) ??
        ServiceEnvironmentType.TEST;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum ServiceEnvironmentType {
  DEV,
  TEST,
  STAGING,
  PROD,
}
