//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ServiceEnvironment<
    TAuthServiceInterface extends AuthServiceInterface,
    TDatabaseServiceInterface extends DatabaseServiceInterface,
    TDatabaseQueryInterface extends DatabaseQueryInterface,
    TFunctionsServiceInterface extends FunctionsServiceInterface> {
  //
  //
  //

  late final TAuthServiceInterface? _authServiceBroker;
  late final TDatabaseServiceInterface? _databaseServiceBroker;
  late final TDatabaseQueryInterface? _databaseQueryBroker;
  late final TFunctionsServiceInterface? _functionsServiceBroker;

  //
  //
  //

  ServiceEnvironment({
    TAuthServiceInterface? authServiceBroker,
    TDatabaseServiceInterface? databaseServiceBroker,
    TDatabaseQueryInterface? databaseQueryBroker,
    TFunctionsServiceInterface? functionsServiceBroker,
  }) {
    this._authServiceBroker = authServiceBroker;
    this._databaseServiceBroker = databaseServiceBroker;
    this._databaseQueryBroker = databaseQueryBroker;
    this._functionsServiceBroker = functionsServiceBroker;
  }

  //
  //
  //

  TAuthServiceInterface get authServiceBroker {
    if (this._authServiceBroker == null) {
      throw UnimplementedError(
        'AuthServiceBroker is not available in the current environment.',
      );
    }
    return this._authServiceBroker;
  }

  TDatabaseServiceInterface get databaseServiceBroker {
    if (this._databaseServiceBroker == null) {
      throw UnimplementedError(
        'DatabaseServiceBroker is not available in the current environment.',
      );
    }
    return this._databaseServiceBroker;
  }

  TDatabaseQueryInterface get databaseQueryBroker {
    if (this._databaseQueryBroker == null) {
      throw UnimplementedError(
        'DatabaseQueryBroker is not available in the current environment.',
      );
    }
    return this._databaseQueryBroker;
  }

  TFunctionsServiceInterface get functionsServiceBroker {
    if (this._functionsServiceBroker == null) {
      throw UnimplementedError(
        'FunctionsServiceBroker is not available in the current environment.',
      );
    }
    return this._functionsServiceBroker;
  }

  //
  //
  //

  UserInterface? get currentUser => this.authServiceBroker.pCurrentUser.value;

  //
  //
  //

  static const CURRENT_SERVICE_ENVIRONMENT =
      String.fromEnvironment('SERVICE_ENVIRONMENT');

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
