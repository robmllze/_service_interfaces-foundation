//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:typed_data';

import '/@functions/src/_all_src.g.dart';
import '/@interfaces/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Defines the core functionalities of a cloud functions service.
///
/// This interface ensures that any cloud functions system implementation
/// adheres to the specified methods and behaviors necessary for executing
/// server-side logic.
/// 
/// It is designed to be backend-agnostic, allowing for integration with various
/// cloud function providers without altering the interface's fundamental
/// operations.
///
/// This flexibility ensures that the application can interact with different
/// cloud function backends while maintaining consistent execution, management,
/// and monitoring of server-side functions across various implementations.
abstract base class FunctionsServiceInterface {
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
      functionsBroker: this,
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
      functionsBroker: this,
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
        functionsBroker: this,
        authServiceBroker: authServiceBroker,
        imageUrl: imageUrl!.toString(),
      );
      final bytes = await getProcessedImageBytes(result);
      return bytes;
    } catch (_) {}
    return null;
  }

  //
  //
  //

  Future<bool> sendMessage({
    required String senderPid,
    required String relationshipId,
    required String message,
  }) async {
    final result = await callSendMessageFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      senderPid: senderPid,
      relationshipId: relationshipId,
      message: message,
    );
    return result.success;
  }
}
