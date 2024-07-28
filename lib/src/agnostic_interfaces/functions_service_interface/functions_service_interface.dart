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

  Future<bool> createJob({
    required String userId,
    required String projectPid,
    required String displayName,
    required String description,
  }) async {
    final result = await invokeCreateJobFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      userId: userId,
      projectPid: projectPid,
      displayName: displayName,
      description: description,
    );
    return result.success;
  }

  //
  //
  //

  Future<ModelJobPub?> readJobPub({
    required String jobPid,
  }) async {
    final result = await invokeReadJobPubFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      jobPid: jobPid,
    );
    final jobPub = ModelJobPub.fromJsonStringOrNull(
      result.response?.body,
    );
    return jobPub;
  }

  //
  //
  //

  Future<bool> updateJobPub({
    required ModelJobPub jobPub,
  }) async {
    final result = await invokeUpdateJobPubFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      jobPub: jobPub,
    );
    return result.success;
  }

  //
  //
  //

  Future<bool> deleteJob({
    required String jobPid,
  }) async {
    final result = await invokeDeleteJobFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      jobPid: jobPid,
    );
    return result.success;
  }

  //
  //
  //

  Future<bool> deleteModel({
    required Model model,
  }) async {
    final result = await invokeDeleteModelsFunction(
      functionsBroker: this,
      authServiceBroker: authServiceBroker,
      model: model,
    );
    return result.success;
  }

  //
  //
  //

  Future<GooglePlacesDataModel?> getPlacesSuggestions({
    required String input,
  }) async {
    try {
      final result = await invokeGetPlacesSuggestionsFunction(
        functionsBroker: this,
        authServiceBroker: authServiceBroker,
        input: input,
      );
      final body = result.response?.body;
      if (body != null) {
        final json = jsonDecode(body)['data'];
        final model = GooglePlacesDataModel.fromJson(json);
        return model;
      }
    } catch (_) {}
    return null;
  }

  //
  //
  //

  Future<GooglePlaceDetailsDataModel?> getPlaceDetails({
    required String placeId,
  }) async {
    try {
      final result = await invokeGetPlaceDetailsFunction(
        functionsBroker: this,
        authServiceBroker: authServiceBroker,
        placeId: placeId,
      );
      final body = result.response?.body;
      if (body != null) {
        final json = jsonDecode(body)['data'];
        final model = GooglePlaceDetailsDataModel.fromJson(json);
        return model;
      }
    } catch (_) {}
    return null;
  }

  //
  //
  //

  Future<bool> deleteCollection({
    required String path,
  }) async {
    final result = await invokeDeleteCollectionFunction(
      functionsBroker: this,
      authServiceBroker: authServiceBroker,
      path: path,
    );
    return result.success;
  }

  //
  //
  //

  Future<bool> sendDataNotifications({
    required String title,
    required String body,
    required Set<String> destinationTokens,
  }) async {
    final result = await invokeSendDataNotificationsFunction(
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
    required List<String> to,
    required String templateId,
    required Map dynamicTemplateData,
  }) async {
    final result = await invokeSendEmailsFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      apiKey: apiKey,
      fromEmail: fromEmail,
      fromName: fromName,
      to: to,
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
      final result = await invokeProcessAvatarImageFunction(
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
    required String relationshipId,
    required String senderPid,
    String? newEventId,
    required String message,
  }) async {
    final result = await invokeSendMessageFunction(
      functionsInterface: this,
      authServiceBroker: authServiceBroker,
      relationshipId: relationshipId,
      senderPid: senderPid,
      newEventId: newEventId,
      message: message,
    );
    return result.success;
  }
}
