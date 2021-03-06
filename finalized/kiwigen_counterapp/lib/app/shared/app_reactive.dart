// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Reactive Component originally created by Naoto of Polyflection under BSD License.
// Modifications by Fredrick Allan Grott under BSD License.


// A special kind of [StreamController] that holds its latest stream data, and
import 'dart:async';



import 'package:kiwigen_counterapp/app/shared/app_reactive_resource.dart';
import 'package:kiwigen_counterapp/app/shared/app_reactive_resource_disposer.dart';
import 'package:kiwigen_counterapp/app/shared/app_reactive_typedef.dart';
import 'package:meta/meta.dart';




/// sends that as the first data to any new listener.
///
/// Reactive stream is a multi-subscription stream, added at Dart version 2.9.0.
/// This allows multiple subscription, and each listener to be treated as an
/// individual stream.
///
/// Reactive's [data] can get and set [data] synchronously. When a new [data]
/// is set, it will be sent to all listeners of Reactive's stream immediately.
///
/// Reactive only supports asynchronous stream for now.
/// Synchronous stream option could be added when some use case is reported.
///
/// # Example
///
/// ```dart
/// final aReactiveInt = Reactive<int>(0, disposer: null);
///
/// aReactiveInt.data = 1;
/// aReactiveInt.stream.listen(print); // prints 1 2 3.
/// aReactiveInt.data = 2;
/// aReactiveInt.stream.listen(print); // prints 2 3.
/// aReactiveInt.data = 3;
/// aReactiveInt.stream.listen(print); // prints 3.
/// print(aReactiveInt.data); // prints 3.
/// ```
///
/// # Disposing its resource, or delegating to other [ReactiveResource].
///
/// Reactive is a kind of [ReactiveResource], which provides
/// resource disposing action by [dispose] sink.
/// [dispose] action can be delegated to other [ReactiveResource],
/// typically a [ReactiveComponent].
/// See [ReactiveComponent] for more explanation about delegating [dispose].
///
/// # Reactive data should be encapsulated in a [ReactiveComponent].
///
/// Reactive is strongly encouraged to be a private member of
/// [ReactiveComponent] to hide its data mutating and other behaviors.
/// Only a stream of a Reactive data should be publicized.
/// Static analysis support is planned to prevent Reactive from being
/// publicized.
///
/// ```dart
/// class C with ReactiveComponent {
///   Reactive<int> __aReactiveInt;
///   Reactive<int> get _aReactiveInt =
///       Reactive<int>(0, disposer: disposer);
///
///   Stream<int> get anIntStream => _aReactiveInt.stream;
/// }
/// ```
/// In current Dart spec, a lazy initialization technique with "??=" let them
/// access the other instance members at its callback functions.
///
/// When "null-safety" is available in a future Dart, thankfully
/// the notation will be conciser as below,
///
/// ```dart
/// class C with ReactiveComponent {
///   late final Reactive<int> _aReactiveInt =
///       Reactive<int>(0, disposer: disposer);
///
///   Stream<int> get anIntStream => _aReactiveInt.stream;
/// }
/// ```
class Reactive<D> with ReactiveResource implements StreamController<D> {
  /// Creates a [Reactive] data with its initial data, and
  /// optional parameters of disposer and callbacks.
  ///
  /// It optionally pass [disposer] for delegating
  /// its own resource disposing.
  ///
  /// [onDispose] callback will be certainly called only once on [dispose]
  /// called.
  ///
  /// [onListen], [onPause], [onResume], [onCancel] are callbacks
  /// to be set to all multi-stream controllers of Reactive.
  Reactive(
    this._data, {
    required ResourceDisposer /*nullable*/ disposer,
    VoidCallback? /*nullable*/ onDispose,
    VoidCallback? /*nullable*/ onListen,
    VoidCallback? /*nullable*/ onPause,
    VoidCallback? /*nullable*/ onResume,
    FutureOrVoidCallback? /*nullable*/ onCancel,
  })  : _onDispose = onDispose,
        _onListen = onListen,
        _onPause = onPause,
        _onResume = onResume,
        _onCancel = onCancel {
    if (disposer != null) {
      delegateDisposingTo(disposer);
    }
  }

  late Stream<D> _stream;

  /// The stream that this controller is controlling.
  ///
  /// This is multi-subscription stream. Each listener to be treated as an
  /// individual stream.
  ///
  /// On listening this stream, [data] will be delivered immediately.
  @override
  Stream<D> get stream => _stream ??= Stream<D>.multi(_onListenMultiStream);

  /// The latest data of this stream controller.
  D get data => _data;

  /// Set [data], then it will be sent to the all stream listeners.
  set data(D newData) {
    _data = newData;
    for (final controller in _controllers) {
      controller.add(_data);
    }
  }

  /// Alias method of [data] setter.
  @override
  void add(D newData) {
    data = newData;
  }

  @override
  void addError(Object error, [StackTrace? /*nullable*/ stackTrace]) {
    for (final controller in _controllers) {
      controller.addError(error, stackTrace);
    }
  }

  @override
  Future<void> addStream(Stream<D> source,
      {bool? /*nullable*/ cancelOnError,}) async {
    // need tests carefully.
    await Future.wait<dynamic>(_controllers
        .map((c) => c.addStream(source, cancelOnError: cancelOnError)));
  }

  @override
  Future<void> close() async {
    dispose();

    return disposed.first;
  }

  @override
  bool get isClosed => _controllers.every((c) => c.isClosed);

  @override
  Future<void> get done => _doneCompleter.future;

  /// Returns a view of this object that only publicizes
  /// the [StreamSink] interface.
  @override
  StreamSink<D> get sink => _StreamSinkWrapper<D>(this);

  @override
  bool get isPaused => _controllers.every((c) => c.isPaused);

  @override
  bool get hasListener => _controllers.any((c) => c.hasListener);

  @override
  VoidCallback? /*nullable*/ get onListen => _onListen;
  @override
  VoidCallback? /*nullable*/ get onPause => _onPause;
  @override
  VoidCallback? /*nullable*/ get onResume => _onResume;
  @override
  FutureOrVoidCallback? /*nullable*/ get onCancel => _onCancel;

  @override
  set onListen(VoidCallback? /*nullable*/ onListenHandler) {
    _onListen = onListenHandler;
    // [_onListen] will be called in [_onListenMultiStream],
    // since, unlike other [MultiStreamController] callbacks,
    // [MultiStreamController] has no effect if it sets [onListen] callback.
  }

  @override
  set onPause(VoidCallback? /*nullable*/ onPauseHandler) {
    _onPause = onPauseHandler;
    for (final controller in _controllers) {
      controller.onPause = _onPause;
    }
  }

  @override
  set onResume(VoidCallback? /*nullable*/ onResumeHandler) {
    _onResume = onResumeHandler;
    for (final controller in _controllers) {
      controller.onResume = _onResume;
    }
  }

  @override
  set onCancel(FutureOrVoidCallback? /*nullable*/ onCancelHandler) {
    _onCancel = onCancelHandler;
    for (final controller in _controllers) {
      controller.onCancel =
          () => _handleOnCancelThenRemoveController(_onCancel!, controller);
    }
  }

  @override
  @protected
  void onDispose() {
    _onDispose?.call();
  }

  @override
  @protected
  Future<void> doDispose() async {
    await _close();
  }

  D _data;

  final VoidCallback? /*nullable*/ _onDispose;

  VoidCallback? /*nullable*/ _onListen;

  /// The callback which is called when a stream is paused.
  /// May be set to `null`, in which case no callback will happen.
  VoidCallback? /*nullable*/ _onPause;

  /// The callback which is called when a stream is resumed.
  /// May be set to `null`, in which case no callback will happen.
  VoidCallback? /*nullable*/ _onResume;

  /// The callback which is called when a stream is canceled.
  /// May be set to `null`, in which case no callback will happen.
  FutureOrVoidCallback? /*nullable*/ _onCancel;

  final _controllers = <MultiStreamController<D>>[];
  final _doneCompleter = Completer<void>();

  Future<void> _onListenMultiStream(MultiStreamController<D> controller) async {
    if (_doneCompleter.isCompleted) {
      await controller.close();
      
      return;
    }

    controller
      ..onPause = onPause
      ..onResume = onResume
      ..onCancel =
          () => _handleOnCancelThenRemoveController(_onCancel!, controller);
    _onListen?.call();
    controller.add(_data);

    _controllers.add(controller);
  }

  Future<void> _handleOnCancelThenRemoveController(
      FutureOrVoidCallback /*nullable*/ onCancelHandler,
      MultiStreamController controller,) async {
    await Future.sync(() => onCancelHandler.call());
    _controllers.remove(controller);
  }

  Future<void> _close() async {
    await Future.wait<dynamic>(_controllers.map((c) => c.close()));
    _doneCompleter.complete();
  }
}

typedef FutureOrVoidCallback = FutureOr<void> Function();

/// A class that publicizes only the [StreamSink] interface of
/// a [StreamController].
class _StreamSinkWrapper<D> implements StreamSink<D> {
  _StreamSinkWrapper(this._target);

  final StreamController<D> _target;

  @override
  void add(D data) {
    _target.add(data);
  }

  @override
  void addError(Object error, [StackTrace? /*nullable*/ stackTrace]) {
    _target.addError(error, stackTrace);
  }

  @override
  Future<void> close() => _target.close();

  @override
  Future<void> addStream(Stream<D> source) => _target.addStream(source);

  @override
  Future<void> get done => _target.done;
}
