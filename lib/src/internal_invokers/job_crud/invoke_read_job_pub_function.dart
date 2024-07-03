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

/// Invokes the `readJob` function.
///
/// - [functionsInterface] The functions broker to use.
/// - [authServiceBroker] The authentication broker to use to verify access.
/// - [jobPid] The PID of the job to read.
///
/// Returns the response and a success flag as a [THttpFunctionResult].
///
/// **Notes:**
///
/// - This assumes that the function is deployed.
Future<THttpFunctionResult> invokeReadJobPubFunction({
  required FunctionsServiceInterface functionsInterface,
  required AuthServiceInterface authServiceBroker,
  required String jobPid,
}) async {
  final idToken = await authServiceBroker.getIdToken();
  final url = functionsInterface.functionsEndpointUrl('readJob');
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $idToken',
    },
    body: jsonEncode({
      'jobPid': jobPid,
    }),
  );
  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}
