// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Reactive Component originally created by Naoto of Polyflection under BSD License.
// Modifications by Fredrick Allan Grott under BSD License.

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:reactivecomponent_bloc/app/shared/app_reactive_resource.dart';
import 'package:reactivecomponent_bloc/app/shared/app_reactive_resource_disposer.dart';
import 'package:reactivecomponent_bloc/app/shared/app_reactive_typedef.dart';
import 'package:reactivecomponent_bloc/app/shared/app_sinks.dart';


typedef OnData<T> = void Function(T data);
typedef Transform<T> = Stream<T> Function(Stream<T> stream);
typedef OnError = void Function(Object error, StackTrace stackTrace);
typedef HandleSubscription<T> = void Function(
    StreamSubscription<T> subscription,);

/// A special kind of [Sink] with its own single stream listener
/// that handles the event data.
///
/// An event stream can be transformed by [Transform] callback function
/// passed at the constructor.
///
/// # Example.
///
/// ```
/// var i = 0;
///
/// final sink = ReactiveSink<int>((event) {
///   i = i + event;
/// }, transform: (stream) => stream.map((e) => e * 2), disposer: null);
///
/// sink(1); // Shorthand notation of "sink.add(1);".
///
/// Future.microtask(() {
///   print(i); // prints 2.
/// });
/// ```
///
/// To save CPU and memory usage, the stream is lazily listened when a first
/// data is added to the sink, or [HandleSubscription] is passed to
/// its constructor.
///
/// # Disposing its resource, or delegating to other [ReactiveResource].
///
/// ReactiveSink is a kind of [ReactiveResource], which provides
/// resource disposing action by [dispose] sink.
/// [dispose] action can be delegated to other [ReactiveResource],
/// typically a [ReactiveComponent].
/// See [ReactiveComponent] for more explanation about delegating [dispose].
abstract class ReactiveSink<T> implements Sink<T> {
  /// Constructs a [ReactiveSink] with its event stream handler.
  ///
  /// It optionally pass [disposer] for delegating
  /// its own resource disposing.
  ///
  /// [onDispose] callback will be certainly called only once on [dispose]
  /// called.
  ///
  /// [onError], [cancelOnError] are callbacks to be set on listening
  /// the event stream.
  ///
  /// [onListen], [onPause], [onResume], [onCancel]
  /// are callbacks to be set to the event stream controller.
  ///
  /// [handleSubscription] is the callback to get the [StreamSubscription] of
  /// the event stream.
  factory ReactiveSink(OnData<T> onData,
          {Transform<T>? /*nullable*/ transform,
          required ResourceDisposer /*nullable*/ disposer,
          VoidCallback? /*nullable*/ onDispose,
          OnError? /*nullable*/ onError,
          bool? /*nullable*/ cancelOnError,
          VoidCallback? /*nullable*/ onListen,
          VoidCallback? /*nullable*/ onPause,
          VoidCallback? /*nullable*/ onResume,
          VoidCallback? /*nullable*/ onCancel,
          HandleSubscription<T>? /*nullable*/ handleSubscription,}) =
      _ReactiveStreamSink<T>;

  /// Adds [event] to the sink.
  ///
  /// Unlike [Sink], it is ignored after a call to [dispose].
  void call(T data);

  /// Alias method of [call].
  @override
  void add(T data);

  /// A [VoidSink] to dispose of the resources.
  VoidSink get dispose;

  /// A stream to notify the resource has been disposed of.
  Stream<void> get disposed;

  /// For only testing.
  @visibleForTesting
  // ignore: cancel_subscriptions
  late StreamSubscription<T> eventStreamSubscription;

  /// For only testing.
  @visibleForTesting
  Future<void> testSinkDone();
}

/// A [ReactiveSink] that implements [EventSink].
abstract class ReactiveEventSink<T> extends ReactiveSink<T>
    implements EventSink<T> {
  /// Constructs [ReactiveEventSink].
  ///
  /// See [ReactiveSink] constructor's API documentation.
  factory ReactiveEventSink(OnData<T> onData,
          {Transform<T> /*nullable*/ transform,
          required ResourceDisposer /*nullable*/ disposer,
          VoidCallback? /*nullable*/ onDispose,
          OnError? /*nullable*/ onError,
          bool? /*nullable*/ cancelOnError,
          VoidCallback? /*nullable*/ onListen,
          VoidCallback? /*nullable*/ onPause,
          VoidCallback? /*nullable*/ onResume,
          VoidCallback? /*nullable*/ onCancel,
          HandleSubscription<T>? /*nullable*/ handleSubscription,}) =
      _ReactiveStreamSink<T>;

  /// Adds [error] to the sink.
  ///
  /// Unlike [Sink], [addError] is ignored after a call to [dispose].
  @override
  void addError(Object error, [StackTrace? /*nullable*/ stackTrace]);
}

/// A [ReactiveSink] that implements [StreamSink].
abstract class ReactiveStreamSink<T> extends ReactiveEventSink<T>
    implements StreamSink<T> {
  /// Constructs [ReactiveStreamSink].
  ///
  /// See [ReactiveSink] constructor's API documentation.
  factory ReactiveStreamSink(OnData<T> onData,
          {Transform<T>? /*nullable*/ transform,
          required ResourceDisposer /*nullable*/ disposer,
          VoidCallback? /*nullable*/ onDispose,
          OnError? /*nullable*/ onError,
          bool? /*nullable*/ cancelOnError,
          VoidCallback? /*nullable*/ onListen,
          VoidCallback? /*nullable*/ onPause,
          VoidCallback? /*nullable*/ onResume,
          VoidCallback? /*nullable*/ onCancel,
          HandleSubscription<T>? /*nullable*/ handleSubscription,}) =
      _ReactiveStreamSink<T>;

  /// Adds [stream] to the sink.
  ///
  /// Unlike [Sink], [addStream] is ignored after a call to [dispose].
  @override
  Future<void> addStream(Stream<T> stream);

  /// This is a future of "[disposed].first;".
  @override
  Future<void> get done;
}

/// [ReactiveSink] of [void] type.
abstract class VoidReactiveSink implements Sink<void> {
  /// Constructs [VoidReactiveSink] with its event stream handler.
  ///
  /// See [ReactiveSink] constructor's API documentation.
  factory VoidReactiveSink(VoidCallback onVoidData,
          {Transform<void>? /*nullable*/ transform,
          required ResourceDisposer /*nullable*/ disposer,
          VoidCallback? /*nullable*/ onDispose,
          OnError? /*nullable*/ onError,
          bool? /*nullable*/ cancelOnError,
          VoidCallback? /*nullable*/ onListen,
          VoidCallback? /*nullable*/ onPause,
          VoidCallback? /*nullable*/ onResume,
          VoidCallback? /*nullable*/ onCancel,
          HandleSubscription<void>? /*nullable*/ handleSubscription,}) =
      _VoidReactiveStreamSink;

  /// Adds void to the sink.
  ///
  /// Unlike [Sink], it is ignored after a call to [dispose],
  /// which is the [Sink] version of [ReactiveSink]'s [close].
  void call();

  /// Alias method of [call].
  @override
  void add([void _]);

  /// A [VoidSink] to dispose of the resources.
  VoidSink get dispose;

  /// A stream to notify the resource has been disposed of.
  Stream get disposed;

  /// For only testing.
  @visibleForTesting
  // ignore: cancel_subscriptions
  late StreamSubscription<void> eventStreamSubscription;
}

/// A [VoidReactiveSink] that implements [EventSink].
abstract class VoidReactiveEventSink extends VoidReactiveSink
    implements EventSink<void> {
  /// Constructs [VoidReactiveEventSink].
  ///
  /// See [ReactiveSink] constructor's API documentation.
  factory VoidReactiveEventSink(VoidCallback onVoidData,
          {Transform<void>? /*nullable*/ transform,
          required ResourceDisposer /*nullable*/ disposer,
          VoidCallback? /*nullable*/ onDispose,
          OnError? /*nullable*/ onError,
          bool? /*nullable*/ cancelOnError,
          VoidCallback? /*nullable*/ onListen,
          VoidCallback? /*nullable*/ onPause,
          VoidCallback? /*nullable*/ onResume,
          VoidCallback? /*nullable*/ onCancel,
          HandleSubscription<void>? /*nullable*/ handleSubscription,}) =
      _VoidReactiveStreamSink;

  /// Adds [error] to the sink.
  ///
  /// Unlike [Sink], [addError] is ignored after a call to [dispose].
  @override
  void addError(Object error, [StackTrace? /*nullable*/ stackTrace]);
}

/// A [VoidReactiveSink] that implements [StreamSink].
abstract class VoidReactiveStreamSink extends VoidReactiveEventSink
    implements StreamSink<void> {
  /// Constructs [VoidReactiveStreamSink].
  ///
  /// See [ReactiveSink] constructor's API documentation.
  factory VoidReactiveStreamSink(VoidCallback onVoidData,
          {Transform<void>? /*nullable*/ transform,
          required ResourceDisposer /*nullable*/ disposer,
          VoidCallback? /*nullable*/ onDispose,
          OnError? /*nullable*/ onError,
          bool? /*nullable*/ cancelOnError,
          VoidCallback? /*nullable*/ onListen,
          VoidCallback? /*nullable*/ onPause,
          VoidCallback? /*nullable*/ onResume,
          VoidCallback? /*nullable*/ onCancel,
          HandleSubscription<void>? /*nullable*/ handleSubscription,}) =
      _VoidReactiveStreamSink;

  /// Adds [stream] to the sink.
  ///
  /// Unlike [Sink], [addStream] is ignored after a call to [dispose].
  @override
  Future<void> addStream(Stream<void> stream);
}

class _ReactiveStreamSink<T>
    with ReactiveResource
    implements ReactiveStreamSink<T> {
  _ReactiveStreamSink(this._onEvent,
      {Transform<T>? /*nullable*/ transform,
      required ResourceDisposer /*nullable*/ disposer,
      VoidCallback? /*nullable*/ onDispose,
      OnError? /*nullable*/ onError,
      bool? /*nullable*/ cancelOnError,
      VoidCallback? /*nullable*/ onListen,
      VoidCallback? /*nullable*/ onPause,
      VoidCallback? /*nullable*/ onResume,
      VoidCallback? /*nullable*/ onCancel,
      HandleSubscription<T>? /*nullable*/ handleSubscription,})
      : _transform = transform,
        _onDispose = onDispose,
        _onError = onError,
        _cancelOnError = cancelOnError,
        _onListen = onListen,
        _onPause = onPause,
        _onResume = onResume,
        _onCancel = onCancel {
    // ignore: unnecessary_null_comparison
    if (disposer != null) {
      delegateDisposingTo(disposer);
    }
    // ignore: unnecessary_null_comparison
    if (handleSubscription != null) {
      _listenOnce();
      handleSubscription(eventStreamSubscription);
    }
  }

  @override
  void call(T event) {
    // This avoids "Bad state: Cannot add event after closing" error.
    if (isDisposeEventSent) return;

    _listenOnce();
    _eventStreamController.add(event);
  }

  @override
  void add(T event) {
    call(event);
  }

  @override
  void addError(Object error, [StackTrace? /*nullable*/ stackTrace]) {
    if (isDisposeEventSent) return;

    _listenOnce();
    _eventStreamController.addError(error, stackTrace);
  }

  @override
  Future<void> addStream(Stream<T> stream) async {
    if (isDisposeEventSent) return;

    _listenOnce();

    return _eventStreamController.addStream(stream);
  }

  @override
  Future<void> close() async {
    if (isDisposeEventSent) return;

    dispose();

    return done;
  }

  @override
  Future<void> get done => disposed.first;

  @visibleForTesting
  @override
  Future<void> testSinkDone() {
    return _eventStreamController.done;
  }

  @override
  @protected
  void onDispose() {
    _onDispose?.call();
  }

  @override
  @protected
  Future<void> doDispose() async {
    await _doCloseSink();
  }

  final OnData<T> _onEvent;
  final Transform<T>? /*nullable*/ _transform;
  final VoidCallback? /*nullable*/ _onDispose;
  final OnError? /*nullable*/ _onError;
  final bool? /*nullable*/ _cancelOnError;
  final VoidCallback? /*nullable*/ _onListen;
  final VoidCallback? /*nullable*/ _onPause;
  final VoidCallback? /*nullable*/ _onResume;
  final VoidCallback? /*nullable*/ _onCancel;

  late StreamController<T> __eventStreamController;
  StreamController<T> get _eventStreamController =>
      __eventStreamController ??= StreamController<T>(
          onListen: _onListen,
          onPause: _onPause,
          onResume: _onResume,
          onCancel: _onCancel,);

  @visibleForTesting
  @override
  late StreamSubscription<T> /*nullable*/ eventStreamSubscription;

  /// Closes [_eventStreamController]'s sink.
  Future<void> _doCloseSink() async {
    if (_eventStreamController.isClosed) return;

    if (_eventStreamController.hasListener) {
      return eventStreamSubscription.cancel();
    } else {
      // ignore: unnecessary_null_comparison
      if (eventStreamSubscription == null) {
        // If a stream is not listened, a sink will not be done.
        // So listening by "drain" here is necessary.
        unawaited(_eventStreamController.stream.drain());
      }
      
      return _eventStreamController.close();
    }
  }

  void _listenOnce() {
    // ignore: unnecessary_null_comparison
    if (eventStreamSubscription != null) return;

    eventStreamSubscription =
        (_transform!.call(_eventStreamController.stream) ??
                _eventStreamController.stream)
            .listen(_onEvent, onError: _onError, cancelOnError: _cancelOnError);
  }
}

class _VoidReactiveStreamSink extends _ReactiveStreamSink<void>
    implements VoidReactiveStreamSink {
  factory _VoidReactiveStreamSink(
    VoidCallback onVoidData, {
    Transform<void>? /*nullable*/ transform,
    required ResourceDisposer /*nullable*/ disposer,
    VoidCallback? /*nullable*/ onDispose,
    OnError? /*nullable*/ onError,
    bool? /*nullable*/ cancelOnError,
    VoidCallback? /*nullable*/ onListen,
    VoidCallback? /*nullable*/ onPause,
    VoidCallback? /*nullable*/ onResume,
    VoidCallback? /*nullable*/ onCancel,
    HandleSubscription<void>? /*nullable*/ handleSubscription,
  }) {
    return _VoidReactiveStreamSink._(
      (void _) {
        onVoidData();
      },
      transform: transform,
      disposer: disposer,
      onDispose: onDispose,
      onError: onError,
      cancelOnError: cancelOnError,
      onListen: onListen,
      onPause: onPause,
      onResume: onResume,
      onCancel: onCancel,
      handleSubscription: handleSubscription,
    );
  }

  _VoidReactiveStreamSink._(
    OnData onData, {
    Transform<void>? /*nullable*/ transform,
    required ResourceDisposer /*nullable*/ disposer,
    VoidCallback? /*nullable*/ onDispose,
    OnError? /*nullable*/ onError,
    bool? /*nullable*/ cancelOnError,
    VoidCallback? /*nullable*/ onListen,
    VoidCallback? /*nullable*/ onPause,
    VoidCallback? /*nullable*/ onResume,
    VoidCallback? /*nullable*/ onCancel,
    HandleSubscription<void>? /*nullable*/ handleSubscription,
  }) : super(
          onData,
          transform: transform,
          disposer: disposer,
          onDispose: onDispose,
          onError: onError,
          cancelOnError: cancelOnError,
          onListen: onListen,
          onPause: onPause,
          onResume: onResume,
          onCancel: onCancel,
          handleSubscription: handleSubscription,
        );

  @override
  void call([void _]) {
    super.call(null);
  }

  @override
  void add([void _]) {
    call();
  }
}
