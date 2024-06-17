//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:equatable/equatable.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// An exception thrown when a user tries to sign up with an email that is
/// already in use.
final class EmailAlreadyInUseException extends AuthServiceException {
  const EmailAlreadyInUseException() : super('email-already-in-use');
}

/// An exception thrown when a user tries to sign in with invalid credentials,
/// such as an incorrect email or password.
final class InvalidCredentialException extends AuthServiceException {
  const InvalidCredentialException() : super('invalid-credential');
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Represents an exception thrown by an authentication service broker.
sealed class AuthServiceException implements Exception, Equatable {
  //
  //
  //

  final String code;

  //
  //
  //

  const AuthServiceException(this.code);

  //
  //
  //

  @override
  String toString() => 'AuthServiceException: $code';

  //
  //
  //

  @override
  List<Object?> get props => [this.code];

  //
  //
  //

  @override
  bool? get stringify => false;
}
