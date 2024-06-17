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

@visibleForTesting
abstract base class FieldValueInterface {
  //
  //
  //

  const FieldValueInterface();

  //
  //
  //

  /// A value to be set on a model field that would delete the field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic deleteFieldValue() {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// A value to be set on a model field that would increment the field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic incremementFieldValue([int i = 1]) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// A value to be set on a model field that would decrement the field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic decrementFieldValue([int i = 1]) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }
  //
  //
  //

  /// A value to be set on a model field that would add elements to a list field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic arrayUnionFieldValue(List elementsToAdd) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }

  //
  //
  //

  /// A value to be set on a model field that would remove elements from a list field.
  ///
  /// Note: Firestore is currently the only known service that supports this
  /// feature. This function could be creatively adapted to simulate similar
  /// behavior with other services. Use this for testing or prototyping only.
  @visibleForTesting
  dynamic arrayRemoveFieldValue(List elementsToRemove) {
    throw UnsupportedError('Only Firestore supports this feature.');
  }
}
