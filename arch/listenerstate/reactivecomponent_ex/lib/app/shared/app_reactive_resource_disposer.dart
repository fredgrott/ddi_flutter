// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Reactive Component originally created by Ntaoo of Polyflection under BSD License.
// Modifications by Fredrick Allan Grott under BSD License.


import 'dart:async';

import 'package:reactivecomponent_ex/app/shared/app_reactive_typedef.dart';

import 'package:reactivecomponent_ex/app/shared/app_sinks.dart';

/// An object to handle resource disposing.
class ResourceDisposer {
  /// Constructs resource disposer.
  ResourceDisposer(
      {required Future<void> Function() /*nullable*/ doDispose,
      required VoidCallback /*nullable*/ onDispose,})
      : _doDispose = doDispose,
        _onDispose = onDispose;

  /// A [VoidSink] to dispose of the resources.
  VoidSink get dispose {
    return _VoidSink(_disposeController.sink, () => !_isDisposeEventSent,
        _wrapOnDispose(_onDispose),);
  }

  /// A stream to notify the resource has been disposed of.
  Stream<void> get disposed => Stream.fromFuture(_disposeController.done);

  /// Check whether an event data has been added to [dispose] sink once.
  ///
  /// It is synchronously set to true on an event data added.
  bool get isDisposeEventSent => _isDisposeEventSent;

  /// Registers a resource disposer for disposing of together.
  ///
  /// If [isDisposeEventSent] is true, then the resource disposer calls
  /// dispose method immediately.
  void register(ResourceDisposer disposer) {
    if (isDisposeEventSent) {
      disposer.dispose();
    } else {
      _disposers.add(disposer);
    }
  }

  /// Delegates its [dispose] call to [disposerDelegate].
  void delegateDisposingTo(ResourceDisposer disposerDelegate) {
    disposerDelegate.register(this);
  }

  final Future<void> Function() /*nullable*/ _doDispose;
  final List<ResourceDisposer> _disposers = [];

  late StreamController<void> __disposeController;
  StreamController<void> get _disposeController => __disposeController ??=
      StreamController<void>()..stream.listen((_) => _dispose());

  Future<void> _dispose() => _doDispose != null
      ? Future.wait([_doDispose(), _disposePrivateResource()])
      : _disposePrivateResource();

  Future<void> _disposePrivateResource() => _disposeController.close();

  final VoidCallback /*nullable*/ _onDispose;

  VoidCallback _wrapOnDispose(VoidCallback /*nullable*/ onDispose) {
    return () {
      if (_isDisposeEventSent) return;
      _isDisposeEventSent = true;
      for (final disposer in _disposers) {
        disposer.dispose();
      }
      onDispose.call();
    };
  }

  bool _isDisposeEventSent = false;
}

class _VoidSink implements VoidSink {
  _VoidSink(this._sink, this._canAdd, this._onAdd);

  final Sink _sink;
  final bool Function() _canAdd;
  final VoidCallback _onAdd;

  @override
  void call() {
    if (_canAdd()) {
      _sink.add(null);
      _onAdd();
    }
  }

  @override
  void add(void _) {
    call();
  }

  @override
  void close() {
    call();
  }
}
