//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

/// An enumeration of the possible persistence mechanism types.
///
/// Setting a persistence type is only available on web based platforms.
enum AuthServicePersistence {
  /// Indicates that the state will be persisted in Local Storage even when the
  /// browser window is closed.
  LOCAL,

  /// Indicates that the state will be persisted in IndexedDB even when the
  /// browser window is closed.
  INDEXED_DB,

  /// Indicates that the state will only be stored in memory and will be
  /// cleared when the window or activity is refreshed.
  NONE,

  /// Indicates that the state will only persist in current session/tab,
  /// relevant to web only, and will be cleared when the tab is closed.
  SESSION,
}
