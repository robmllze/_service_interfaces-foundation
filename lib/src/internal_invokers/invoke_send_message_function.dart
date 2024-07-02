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

/// Invoke the `send_message` function.
///
/// - [functionsInterface] The functions broker to use.
/// - [authServiceBroker] The authentication broker to use to verify access.
/// - [relationshipId] The ID of the relationship to send the message to.
/// - [newEventId] An optional event ID for the message. Otherwise one will
/// be generated.
/// - [senderPid] The sender's PID.
/// - [message] The message to send.
///
/// Returns the response and a success flag as a [THttpFunctionResult].
Future<THttpFunctionResult> invokeSendMessageFunction({
  required FunctionsServiceInterface functionsInterface,
  required AuthServiceInterface authServiceBroker,
  required String relationshipId,
  String? newEventId,
  required String senderPid,
  required String message,
}) async {
  final idToken = await authServiceBroker.getIdToken();
  final url = functionsInterface.functionsEndpointUrl('sendMessage');
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $idToken',
    },
    body: jsonEncode({
      'relationshipId': relationshipId,
      if (newEventId != null) 'newEventId': newEventId,
      'senderPid': senderPid,
      'message': message,
    }),
  );

  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}
