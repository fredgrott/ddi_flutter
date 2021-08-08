// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Reactive Component originally created by Naoto of Polyflection under BSD License.
// Modifications by Fredrick Allan Grott under BSD License.


import 'package:meta/meta.dart';
import 'package:reactivecomponent_ex/app/shared/app_reactive_resource_disposer.dart';
import 'package:reactivecomponent_ex/app/shared/app_sinks.dart';


/// A mixin that handles resource disposing with only [Sink] and [Stream]
/// public interface.
///
/// ReactiveResource is designed as mixin, avoiding inheritance deliberately,
/// so that a subclass can freely inherit from other class as necessary.
//
// Development note: A mixin can not mix-into other mixin in current Dart spec.
// So it's necessary to do "copy and paste" the members to other mixin.
// Currently the targets are both ReactiveComponent and ReactiveOutputComponent.
// For doing "copy & paste" all the members easily, ReactiveResource
// implements _ReactiveResource just to add override annotations to all members.
mixin ReactiveResource implements _ReactiveResource {
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

abstract class _ReactiveResource {
  VoidSink get dispose;

  Stream<void> get disposed;

  @protected
  ResourceDisposer get disposer;

  @protected
  Future<void> doDispose();

  @protected
  void onDispose() {}

  @protected
  bool get isDisposeEventSent;

  @protected
  void delegateDisposingTo(ResourceDisposer disposerDelegate);
}
