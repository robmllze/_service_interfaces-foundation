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

/// Invoke the `send_emails_via_sendgrid` function.
///
/// - [functionsInterface] The functions broker to use.
/// - [authServiceBroker] The authentication broker to use to verify access.
/// - [apiKey] The SendGrid API key to use.
/// - [fromEmail] The email address to send the email from.
/// - [fromName] The name to send the email from.
/// - [to] The list of email addresses to send the email to.
/// - [templateId] The SendGrid template ID to use.
/// - [dynamicTemplateData] The dynamic template data to use.
///
/// Returns the response and a success flag as a [THttpFunctionResult].
///
/// **Notes:**
///
/// - This assumes that the function is deployed.
Future<THttpFunctionResult> invokeSendEmailsFunction({
  required FunctionsServiceInterface functionsInterface,
  required AuthServiceInterface authServiceBroker,
  required String apiKey,
  required String templateId,
  required String fromName,
  required String fromEmail,
  required List<String> to,
  required Map dynamicTemplateData,
}) async {
  final idToken = await authServiceBroker.getIdToken();
  final url = functionsInterface.functionsEndpointUrl('sendEmailsViaSendGrid');
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $idToken',
    },
    body: jsonEncode({
      'apiKey': apiKey,
      'templateId': templateId,
      'from': {
        'name': fromName,
        'email': fromEmail,
      },
      'to': to,
      'dynamicTemplateData': dynamicTemplateData,
    }),
  );

  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}
