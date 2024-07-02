//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licensing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Invoke the `process_avatar_image` function.
///
/// - [functionsBroker] - The functions broker to use.
/// - [authServiceBroker] -The authentication broker to use to verify access.
/// - [imageUrl] - The URL as a [String] or [Uri] of the image to process.
/// - [cropWidth] - The width to crop the image to.
/// - [cropHeight] - The height to crop the image to.
///
/// Returns the response and a success flag as a [THttpFunctionResult].
///
/// **Notes:**
///
/// - This assumes that the function is deployed.
Future<THttpFunctionResult> invokeProcessAvatarImageFunction({
  required FunctionsServiceInterface functionsBroker,
  required AuthServiceInterface authServiceBroker,
  required dynamic imageUrl,
  int cropWidth = 64,
  int cropHeight = 64,
}) async {
  final idToken = await authServiceBroker.getIdToken();
  final url = functionsBroker.functionsEndpointUrl('processAvatarImage');
  final response = await post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $idToken',
    },
    body: jsonEncode({
      'imageUrl': imageUrl!.toString(),
      'cropWidth': cropWidth,
      'cropHeight': cropHeight,
    }),
  );

  if (response.statusCode == 200) {
    return (response: response, success: true);
  } else {
    return (response: response, success: false);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Extracts the processed image bytes from the value returned from
/// [invokeProcessAvatarImageFunction].
///
/// - [callProcessAvatarImageResult] The value returned from
/// [invokeProcessAvatarImageFunction].
///
/// Returns the processed image bytes as a [Uint8List] or `null` if the image
/// could not be processed.
Future<Uint8List?> getProcessedImageBytes(
  THttpFunctionResult callProcessAvatarImageResult,
) async {
  try {
    final decoded = jsonDecode(
      callProcessAvatarImageResult.response!.body,
    );
    final base64Image = decoded['image'] as String;
    final result = base64Decode(base64Image.split(',').last);
    return result;
  } catch (_) {}
  return null;
}
