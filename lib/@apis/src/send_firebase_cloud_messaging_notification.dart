//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xyz_utils/web_friendly.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Sends a notification to a device using Firebase Cloud Messaging.
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
Future<THttpFunctionResult> sendFirebaseCloudMessagingNotification({
  required String projectId,
  required String fcmAccessToken,
  required String title,
  required String body,
  required String destinationToken,
}) async {
  final url = Uri.parse('https://fcm.googleapis.com/v1/projects/$projectId/messages:send');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $fcmAccessToken',
    },
    body: jsonEncode({
      'message': {
        'token': destinationToken,
        'data': {
          'title': title,
          'body': body,
        },
      },
    }),
  );

  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}
