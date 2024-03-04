//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class AuthServiceInterface {
  //
  //
  //

  final pCurrentUser = Pod<UserInterface?>(null);
  void Function(UserInterface)? onLogin;
  void Function()? onLogout;

  //
  //
  //

  AuthServiceInterface({
    this.onLogin,
    this.onLogout,
  });

  //
  //
  //

  Future<bool> checkPersistency();

  //
  //
  //

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  //
  //
  //

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  //
  //
  //

  Future<void> logOut();

  //
  //
  //

  bool get loggedIn => this.pCurrentUser.value != null;
  bool get loggedInAndEmailVerified =>
      this.loggedIn && this.pCurrentUser.value?.emailVerified != false;
  bool get loggedOut => !this.loggedIn;

  //
  //
  //

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  //
  //
  //

  void dispose() {
    this.pCurrentUser.dispose();
  }

  //
  //
  //

  Future<String?> getIdToken();
}
