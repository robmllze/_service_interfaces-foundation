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

Future<TFunctionResult> callSendNotificationsFunction({
  required FunctionsServiceInterface functionsInterface,
  required AuthServiceInterface authServiceBroker,
  required String title,
  required String body,
  required Set<String> destinationTokens,
}) async {
  assert(
    destinationTokens.map((e) => e.nullIfEmpty).nonNulls.isNotEmpty,
    'destinationTokens must not be empty',
  );
  final idToken = await authServiceBroker.getIdToken();
  final url = functionsInterface.functionsEndpointUrl('send_notifications');
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $idToken',
    },
    body: jsonEncode({
      'title': title,
      'body': body,
      'destination_tokens': destinationTokens.toList(),
    }),
  );

  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}
