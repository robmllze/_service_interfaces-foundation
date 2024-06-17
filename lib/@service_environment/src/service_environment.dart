//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/@service_environment/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Represents the service environment of the app, encapsulating all necessary
/// service brokers.
/// 
/// This setup centralizes backend service interactionn required by the app,
/// enhancing modularity and facilitating environment-specific configurations.
/// It is designed to be backend-agnostic, allowing the app to integrate
/// seamlessly with different types of services without dependency on specific
/// implementations. This class acts as a container for various service
/// interfaces such as authentication, database operations, file management,
/// and more, each defined by specific generic parameters.
/// 
/// By managing these services centrally, this class simplifies the
/// architectural complexity and boosts the scalability and maintainability of
/// the application.
class ServiceEnvironment<
    TAuthServiceInterface extends AuthServiceInterface,
    TDatabaseServiceInterface extends DatabaseServiceInterface,
    TDatabaseQueryInterface extends DatabaseQueryInterface,
    TFunctionsServiceInterface extends FunctionsServiceInterface,
    TFileServiceInterface extends FileServiceInterface,
    TNotificationServiceInterface extends NotificationServiceInterface> {
  //
  //
  //

  late final TAuthServiceInterface? _authServiceBroker;
  late final TDatabaseServiceInterface? _databaseServiceBroker;
  late final TDatabaseQueryInterface? _databaseQueryBroker;
  late final TFunctionsServiceInterface? _functionsServiceBroker;
  late final TFileServiceInterface? _fileServiceBroker;
  late final TNotificationServiceInterface? _notificationServiceBroker;

  //
  //
  //

  ServiceEnvironment({
    TAuthServiceInterface? authServiceBroker,
    TDatabaseServiceInterface? databaseServiceBroker,
    TDatabaseQueryInterface? databaseQueryBroker,
    TFunctionsServiceInterface? functionsServiceBroker,
    TFileServiceInterface? fileServiceBroker,
    TNotificationServiceInterface? notificationServiceBroker,
  }) {
    this._authServiceBroker = authServiceBroker;
    this._databaseServiceBroker = databaseServiceBroker;
    this._databaseQueryBroker = databaseQueryBroker;
    this._functionsServiceBroker = functionsServiceBroker;
    this._fileServiceBroker = fileServiceBroker;
    this._notificationServiceBroker = notificationServiceBroker;
  }

  //
  //
  //

  /// The current service environment provided by the environment variable.
  static const CURRENT_SERVICE_ENVIRONMENT = String.fromEnvironment('SERVICE_ENVIRONMENT');

  /// Returns the current service environment. Defaults to
  /// [ServiceEnvironmentType.TEST] if the environment variable is not set.
  ///
  /// To specify the service environment, run or build the app with one of
  /// the following flags:
  ///
  /// - `--dart-define=SERVICE_ENVIRONMENT=DEV`
  /// - `--dart-define=SERVICE_ENVIRONMENT=TEST`
  /// - `--dart-define=SERVICE_ENVIRONMENT=STAGING`
  /// - `--dart-define=SERVICE_ENVIRONMENT=PROD`
  static ServiceEnvironmentType get currentServiceEnvironment {
    return ServiceEnvironmentType.values.valueOf(CURRENT_SERVICE_ENVIRONMENT) ??
        ServiceEnvironmentType.TEST;
  }

  //
  //
  //

  /// The current authenticated user model.
  ModelAuthUser? get currentUser => this.authServiceBroker.pCurrentUser.value;

  /// The authentication service broker to manage user authentication.
  TAuthServiceInterface get authServiceBroker {
    if (this._authServiceBroker == null) {
      throw UnimplementedError(
        'authServiceBroker is not available in the current environment.',
      );
    }
    return this._authServiceBroker;
  }

  //
  //
  //

  /// The database service broker to manage database CRUD operations.
  TDatabaseServiceInterface get databaseServiceBroker {
    if (this._databaseServiceBroker == null) {
      throw UnimplementedError(
        'databaseServiceBroker is not available in the current environment.',
      );
    }
    return this._databaseServiceBroker;
  }

  //
  //
  //

  /// The database query broker to manage database queries.
  TDatabaseQueryInterface get databaseQueryBroker {
    if (this._databaseQueryBroker == null) {
      throw UnimplementedError(
        'databaseQueryBroker is not available in the current environment.',
      );
    }
    return this._databaseQueryBroker;
  }

  //
  //
  //

  /// The functions service broker to manage cloud functions.
  TFunctionsServiceInterface get functionsServiceBroker {
    if (this._functionsServiceBroker == null) {
      throw UnimplementedError(
        'functionsServiceBroker is not available in the current environment.',
      );
    }
    return this._functionsServiceBroker;
  }

  //
  //
  //

  /// The file service broker to manage file uploads and downloads.
  TFileServiceInterface get fileServiceBroker {
    if (this._fileServiceBroker == null) {
      throw UnimplementedError(
        'fileServiceBroker is not available in the current environment.',
      );
    }
    return this._fileServiceBroker;
  }

  //
  //
  //

  /// The notification service broker to manage notifications.
  TNotificationServiceInterface get notificationServiceBroker {
    if (this._notificationServiceBroker == null) {
      throw UnimplementedError(
        'notificationServiceBroker is not available in the current environment.',
      );
    }
    return this._notificationServiceBroker;
  }
}
