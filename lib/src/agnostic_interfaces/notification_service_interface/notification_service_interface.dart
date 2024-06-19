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

/// Defines the core functionalities of a notification service.
///
/// This interface ensures that any notification system implementation adheres to the
/// specified methods and behaviors necessary for managing and dispatching notifications
/// within the application.
///
/// It is designed to be backend-agnostic, enabling integration with various
/// notification systems without altering the interface's fundamental operations.
///
/// This flexibility ensures that the application can interact with different
/// notification backends while maintaining consistent notification
/// functionalities across various implementations.
abstract base class NotificationServiceInterface {
  //
  //
  //

  const NotificationServiceInterface();

  //
  //
  //

  Future<void> send({
    required String title,
    required String body,
    required Set<String> destinationTokens,
  });

  //
  //
  //

  /// Registers the device, enabling it to receive notifications. The
  /// [currentUserPid] and [location] are used to create a
  /// [ModelDeviceRegistration] entry on the database that can be used to
  /// track the device and send notifications to it.
  Future<void> register({
    required String currentUserPid,
    ModelLocation? location,
  });

  //
  //
  //

  /// Executes custom actions when a device is registered. Use [registration] to
  /// access registration details.
  void onRegisterDevice(ModelDeviceRegistration registration);

  //
  //
  //

  /// Unregisters the device, disabling it from receiving notifications. This
  /// will remove the [ModelDeviceRegistration] entry associated with the
  /// [currentUserPid] from the database.
  Future<void> unregister({
    required String currentUserPid,
  });

  //
  //
  //

  /// Prompts the user to authorize the app to send notifications, sets the
  /// [pAuthorizationStatus] with the result and returns the result.
  Future<dynamic> checkAuthorizationStatus();

  /// Holds the current authorization status of the app to send notifications.
  PodListenable<dynamic> get pAuthorizationStatus;

  /// Returns `true` if the location permission is granted. This is a volatile
  /// snapshot and depends on [pAuthorizationStatus].
  bool authorizationStatusGrantedSnapshot();

  //
  //
  //

  Future<void> subscribeToTopic(String topic);

  //
  //
  //

  Future<void> unsubscribeFromTopic(String topic);

  //
  //
  //

  void dispose() async {
    this.pAuthorizationStatus.dispose();
  }
}
