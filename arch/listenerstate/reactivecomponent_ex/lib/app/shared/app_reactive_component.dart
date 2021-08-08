// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Reactive Component originally created by Naoto of Polyflection under BSD License.
// Modifications by Fredrick Allan Grott under BSD License.

import 'package:meta/meta.dart';
import 'package:reactivecomponent_ex/app/shared/app_reactive_resource.dart';
import 'package:reactivecomponent_ex/app/shared/app_reactive_resource_disposer.dart';
import 'package:reactivecomponent_ex/app/shared/app_sinks.dart';


/// A mixin that represents ReactiveComponent.
///
/// ReactiveComponent is a unit for stream-based reactive programming, that
/// encapsulates its members and publicizes only [Sink] and [Stream] interfaces.
///
/// It can be a delegate to its instance members of [ReactiveResource]
/// via [disposer], for disposing of their resources together.
///
/// Deliberately, it is designed as mixin, so that a subclass can freely
/// inherit from other class as necessary.
///
/// # Simple example
///
/// ```
/// class Counter with ReactiveComponent {
///   Counter(this._initialCount);
///   final int _initialCount;
///
///   VoidReactiveSink _increment;
///   VoidReactiveSink get increment => _increment ??= VoidReactiveSink((_) {
///         _count.data++;
///       }, disposer: disposer);
///
///   Reactive<int> __count;
///   Reactive<int> get _count => __count ??= Reactive<int>(_initialCount,
///       disposer: disposer);
///   Stream<int> get count => _count.stream;
/// }
///
/// final counter = Counter(0);
///
/// // Initial data is delivered immediately.
/// print(counter.count.first.then(print)); // prints 0.
///
/// // Add null data to the `increment` Sink.
/// // This is shorthand notation of `counter.increment.add(null);`.
/// counter.increment();
///
/// // Multiple listeners are allowed. The latest data is immediately delivered
/// // on each listen.
/// print(await counter.count.listen(print)); // prints 1.
/// print(await counter.count.listen(print)); // prints 1.
///
/// // Add null data to the `dispose` Sink.
/// // This is shorthand notation of `counter.dispose.add(null);`.
/// // The all resources of the component (`_increment` and `__count`)
/// // will be disposed of together.
/// counter.dispose();
/// ```
///
/// It utilizes lazy initialization technique ( "??=" ) so that the two
/// instance members can access the other members on their callback functions.
///
/// With `late` notation in null-safety feature, `Counter` will be conciser
/// as below,
///
/// ```
/// class Counter with ReactiveComponent {
///   Counter(this._initialCount);
///   final int _initialCount;
///
///   late final VoidReactiveSink increment = VoidReactiveSink((_) {
///         _count.data++;
///       }, disposer: disposer);
///
///   late final _count = Reactive<int>(_initialCount, disposer: disposer);
///   Stream<int> get count => _count.stream;
/// }
/// ```
///
/// More examples are listed on this package's example/ directory, including
/// complex composed components, and composing Firebase.
///
/// https://github.com/polyflection/reactive_component/tree/master/example
@streamIO
mixin ReactiveComponent implements ReactiveResource {
  /// A [VoidSink] to dispose of the resources.
  @override
  VoidSink get dispose => disposer.dispose;

  /// A stream to notify the resource has been disposed of.
  @override
  Stream<void> get disposed => disposer.disposed;

  late ResourceDisposer _disposer;

  /// A subject of disposing the resources.
  ///
  /// A disposer can be a delegate to other resources' disposers.
  @override
  @protected
  ResourceDisposer get disposer => _disposer ??=
      ResourceDisposer(doDispose: doDispose, onDispose: onDispose);

  /// Check whether an event data has been added to [dispose] sink once.
  ///
  /// It is synchronously set to true on an event data added.
  @override
  @protected
  bool get isDisposeEventSent => disposer.isDisposeEventSent;

  /// Dispose its own resources.
  ///
  /// It's subclass responsibility for defining action of disposing
  /// its own resources.
  ///
  /// This method is intended to be called by [ResourceDisposer].
  /// A subclass should not call it directly.
  @override
  @protected
  Future<void> doDispose() async {}

  /// A synchronous callback on adding event data to [dispose].
  ///
  /// This method is intended to be called by [ResourceDisposer].
  /// A subclass should not call it directly.
  @override
  @protected
  void onDispose() {}

  /// Delegates its [dispose] call to [disposerDelegate].
  ///
  /// If [disposerDelegate] has already started disposing of its resources,
  /// [dispose] is called immediately.
  ///
  /// A subclass can still call [dispose] after delegating for now,
  /// but this behavior will likely change in a future version of this package.
  @override
  @protected
  void delegateDisposingTo(ResourceDisposer disposerDelegate) =>
      disposer.delegateDisposingTo(disposerDelegate);
}

/// ReactiveOutputComponent
///
/// This will be ReactiveComponent mixin without Sink constraint,
/// but functions with FutureOr<void> return types.
/// This will be a more convenient option, while it will lose ReactiveSink's
/// capability, and some hook abilities planned in a future version.
@streamOutput
@experimental
mixin ReactiveOutputComponent implements ReactiveResource {
  /// A [VoidSink] to dispose of the resources.
  @override
  VoidSink get dispose => disposer.dispose;

  /// A stream to notify the resource has been disposed of.
  @override
  Stream<void> get disposed => disposer.disposed;

  late ResourceDisposer _disposer;

  /// A subject of disposing the resources.
  ///
  /// A disposer can be a delegate to other resources' disposers.
  @override
  @protected
  ResourceDisposer get disposer => _disposer ??=
      ResourceDisposer(doDispose: doDispose, onDispose: onDispose);

  /// Check whether an event data has been added to [dispose] sink once.
  ///
  /// It is synchronously set to true on an event data added.
  @override
  @protected
  bool get isDisposeEventSent => disposer.isDisposeEventSent;

  /// Dispose its own resources.
  ///
  /// It's subclass responsibility for defining action of disposing
  /// its own resources.
  ///
  /// This method is intended to be called by [ResourceDisposer].
  /// A subclass should not call it directly.
  @override
  @protected
  Future<void> doDispose() async {}

  /// A synchronous callback on adding event data to [dispose].
  ///
  /// This method is intended to be called by [ResourceDisposer].
  /// A subclass should not call it directly.
  @override
  @protected
  void onDispose() {}

  /// Delegates its [dispose] call to [disposerDelegate].
  ///
  /// If [disposerDelegate] has already started disposing of its resources,
  /// [dispose] is called immediately.
  ///
  /// A subclass can still call [dispose] after delegating for now,
  /// but this behavior will likely change in a future version of this package.
  @override
  @protected
  void delegateDisposingTo(ResourceDisposer disposerDelegate) =>
      disposer.delegateDisposingTo(disposerDelegate);
}

/// The annotation `@streamIO` marks all public instance members' return type
/// in the class must be a kind of [Stream] or [Sink].
///
/// *Unimplemented*.
const streamIO = _StreamIO();

class _StreamIO {
  const _StreamIO();
}

/// The annotation `@streamOutput` marks all public instance members'
/// return type in the class must be a kind of [Stream] or [FutureOr<void>].
///
/// *Unimplemented*.
const streamOutput = _StreamOutput();

class _StreamOutput {
  const _StreamOutput();
}
