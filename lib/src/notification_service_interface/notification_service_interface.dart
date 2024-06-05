//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

abstract class NotificationServiceInterface {
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
    required String topic,
    required Map<String, dynamic> data,
  });

  //
  //
  //

  /// Gets the current notification token for the device.
  Future<String?> getToken();

  //
  //
  //

  Future<void> subscribeToTopic(String topic);

  //
  //
  //

  Future<void> unsubscribeFromTopic(String topic);
}
