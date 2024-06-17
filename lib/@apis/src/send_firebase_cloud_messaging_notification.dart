//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/@apis/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Sends a notification to a device using Firebase Cloud Messaging (FCM).
///
/// - [projectId] The Firebase project ID.
/// - [fcmAccessToken] The access token for the FCM API.
/// - [data] Optional data to send with the notification.
/// - [title] An optional title for the data notification.
/// - [body] An optional body for the data notification.
/// - [destinationToken] The FCM token of the device to send the notification to.
/// 
/// Returns the response and a success flag as a [THttpFunctionResult].
///
/// **Notes:**
/// 
/// To obtain the [fcmAccessToken], first generate a new private key for your
/// project [projectId] from the Firebase Console here:
/// https://console.firebase.google.com/u/0/project/jobxcel-test/settings/serviceaccounts/adminsdk
///
/// This will download a JSON file containing the private key. Save this file
/// and install gcloud. Then use the following commands to activate the service
/// account and print the access token:
///
/// ```sh
/// gcloud auth activate-service-account --key-file=service-account.json
/// gcloud auth print-access-token
/// ```
Future<THttpFunctionResult> sendFcmDataNotification({
  required String projectId,
  required String fcmAccessToken,
  Map<String, String>? data,
  String? title,
  String? body,
  required String destinationToken,
}) async {
  final url = Uri.parse('https://fcm.googleapis.com/v1/projects/$projectId/messages:send');
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $fcmAccessToken',
    },
    body: jsonEncode({
      'message': {
        'token': destinationToken,
        'data': {
          ...?data,
          'title': title,
          'body': body,
        }.nonNullValues,
      },
    }),
  );

  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}
