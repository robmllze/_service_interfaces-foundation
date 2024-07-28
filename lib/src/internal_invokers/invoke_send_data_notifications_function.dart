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

/// Invoke the `send_notifications` function.
///
/// - [functionsInterface] The functions broker to use.
/// - [authServiceBroker] The authentication broker to use to verify access.
/// - [title] The title of the notification.
/// - [body] The body of the notification.
/// - [destinationTokens] The list of destination tokens to send the
/// notification to.
/// - [filteringInfo] Provide filtering info so that notifications are not
/// sent to unsubscribed pubs.
///
/// Returns the response and a success flag as a [THttpFunctionResult].
///
/// **Notes:**
///
/// - This assumes that the function is deployed.
Future<THttpFunctionResult> invokeSendDataNotificationsFunction({
  required FunctionsServiceInterface functionsInterface,
  required AuthServiceInterface authServiceBroker,
  required String title,
  required String body,
  required Set<String> destinationTokens,
  required FilteringInfo? filteringInfo,
}) async {
  assert(
    destinationTokens.map((e) => e.nullIfEmpty).nonNulls.isNotEmpty,
    'destinationTokens must not be empty',
  );
  final idToken = await authServiceBroker.getIdToken();
  final url = functionsInterface.functionsEndpointUrl('sendDataNotifications');
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $idToken',
    },
    body: jsonEncode(
      {
        'title': title,
        'body': body,
        'destinationTokens': destinationTokens.toList(),
        'filteringInfo': filteringInfo?._copyWithDestinationTokens(destinationTokens).toJson(),
      }.nonNullValues,
    ),
  );

  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class FilteringInfo {
  //
  //
  //

  final String senderPid;
  final String relationshipId;
  final Set<String> destinationTokens;

  //
  //
  //

  const FilteringInfo({
    required this.senderPid,
    required this.relationshipId,
  }) : this.destinationTokens = const {};

  //
  //
  //

  const FilteringInfo._({
    required this.senderPid,
    required this.relationshipId,
    required this.destinationTokens,
  });

  //
  //
  //

  FilteringInfo _copyWithDestinationTokens(
    Set<String> destinationTokens,
  ) {
    return FilteringInfo._(
      senderPid: this.senderPid,
      relationshipId: this.relationshipId,
      destinationTokens: destinationTokens,
    );
  }

  //
  //
  //

  Map<String, dynamic> toJson() {
    return {
      'senderPid': senderPid,
      'relationshipId': relationshipId,
      'destinationTokens': destinationTokens.toList(),
    };
  }
}
