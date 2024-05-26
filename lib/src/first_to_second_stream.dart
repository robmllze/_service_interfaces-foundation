//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:async';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Combines two streams into one. The first stream is used to create the
/// second stream. The second stream is then returned.
Stream<B> firstToSecondStream<A, B>(
  Stream<A> stream1,
  Stream<B> Function(A result1) stream2Creator,
) {
  late StreamController<B> controller;
  late StreamSubscription<A> subscription1;
  late StreamSubscription<B> subscription2;
  controller = StreamController<B>(
    onListen: () {
      subscription1 = stream1.listen(
        (result1) {
          final stream2 = stream2Creator(result1);
          subscription2 = stream2.listen(
            controller.add,
            onError: controller.addError,
            onDone: controller.close,
          );
          subscription1.cancel();
        },
        onError: controller.addError,
        onDone: controller.close,
        cancelOnError: true,
      );
    },
    onCancel: () => Future.wait([
      subscription2.cancel(),
      subscription1.cancel(),
    ]),
  );
  return controller.stream;
}
