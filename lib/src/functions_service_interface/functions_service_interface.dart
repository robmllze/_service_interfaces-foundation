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

abstract class FunctionsServiceInterface {
  //
  //
  //

  final String region;
  final String projectId;
  final AuthServiceInterface authServiceBroker;

  //
  //
  //

  FunctionsServiceInterface({
    required this.region,
    required this.projectId,
    required this.authServiceBroker,
  });

  //
  //
  //

  Uri functionsEndpointUrl(String functionId);

  //
  //
  //

  Future<bool> deleteJob({
    required String jobId,
    required String jobPid,
  }) async {
    final result = await callDeleteJobFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      jobId: jobId,
      jobPid: jobPid,
    );
    return result.success;
  }

  //
  //
  //

  Future<bool> deleteDocument({
    required String documentPath,
  }) async {
    final result = await callDeleteDocumentFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      documentPath: documentPath,
    );
    return result.success;
  }

  //
  //
  //

  Future<bool> deleteCollection({
    required String collectionPath,
  }) async {
    final result = await callDeleteCollectionFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      collectionPath: collectionPath,
    );
    return result.success;
  }

  //
  //
  //

  Future<bool> sendNotifications({
    required String title,
    required String body,
    required Set<String> destinationTokens,
  }) async {
    final result = await callSendNotificationsFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      title: title,
      body: body,
      destinationTokens: destinationTokens,
    );
    return result.success;
  }

  //
  //
  //

  Future<bool> sendEmails({
    required String apiKey,
    required String fromEmail,
    required String fromName,
    required List<String> toEmails,
    required String templateId,
    required Map dynamicTemplateData,
  }) async {
    final result = await callSendEmailsFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      apiKey: apiKey,
      fromEmail: fromEmail,
      fromName: fromName,
      toEmails: toEmails,
      templateId: templateId,
      dynamicTemplateData: dynamicTemplateData,
    );
    return result.success;
  }

  //
  //
  //

  Future<Uint8List?> processAvatarImage({
    required dynamic imageUrl,
  }) async {
    try {
      final result = await callProcessAvatarImage(
        functionsInterface: this,
        authServiceBroker: authServiceBroker,
        imageUrl: imageUrl!.toString(),
      );
      final bytes = await getProcessedImageBytes(result);
      return bytes;
    } catch (_) {}
    return null;
  }
}
