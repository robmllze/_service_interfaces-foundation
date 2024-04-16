//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:http/http.dart' as http;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<(http.Response?, bool)> callSendEmailsViaSendGridFunction({
  required FunctionsServiceInterface functionsInterface,
  required AuthServiceInterface authServiceBroker,
  required String apiKey,
  required String fromEmail,
  required String fromName,
  required List<String> toEmails,
  required String templateId,
  required Map dynamicTemplateData,
}) async {
  final idToken = await authServiceBroker.getIdToken();
  final url = functionsInterface.functionsEndpointUrl('send_emails_via_sendgrid');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $idToken',
    },
    body: jsonEncode({
      'api_key': apiKey,
      'from_email': fromEmail,
      'from_name': fromName,
      'to_emails': toEmails,
      'template_id': templateId,
      'dynamic_template_data': dynamicTemplateData,
    }),
  );

  if (response.statusCode == 200) {
    return (response, true);
  } else {
    return (response, false);
  }
}
