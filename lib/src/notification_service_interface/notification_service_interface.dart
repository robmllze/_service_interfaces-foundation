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

  void onRegistered(ModelAppRegistration registration);

  //
  //
  //

  Future<void> register({required String currentUserPid});

  //
  //
  //

  Future<ModelAppRegistration?> getNewRegistration();

  //
  //
  //

  Future<void> subscribeToTopic(String topic);

  //
  //
  //

  Future<void> unsubscribeFromTopic(String topic);
}
