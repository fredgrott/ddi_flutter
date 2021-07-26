// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is Inherited State by FlutterDevTools BSD and modifications are under BSD license

import 'package:flutter/widgets.dart';

import 'package:setstate_exp/app/shared/app_di_state_inject.dart';
import 'package:setstate_exp/app/shared/app_di_state_reactivecontroller.dart';

/// Alias for [ReactiveState]
class RS {
  /// Alias for [ReactiveState.getReactive]
  static ReactiveController<T> getReactive<T>(BuildContext context,
          {bool subscribe = false,}) =>
      ReactiveState.getReactive(context, subscribe: subscribe);

  /// Alias for [ReactiveState.get]
  static T get<T>(BuildContext context) => ReactiveState.get(context);

  /// Alias for [ReactiveState.getReactive]
  static ReactiveController<T> getReactiveFromRoot<T>() =>
      ReactiveState.getRootInjectable<T>().stateSingleton;

  /// Alias for [ReactiveState.get]
  static T getFromRoot<T>() => ReactiveState.getRootInjectable<T>().singleton;

  /// Alias for [ReactiveState.set]
  static T set<T>(BuildContext context, [dynamic Function(T)? call]) =>
      ReactiveState.set(context, call);
}

/// [ReactiveState] is used to access reactive state controller of a given pre-registered type.
/// This instance is reactive and is useful for updating all subscribers when
/// the [ReactiveController.setState] method is called.
class ReactiveState {
  /// Provides a way to access a pre-registered reactive controller instance of type [T].
  /// If the [subscribe] option is true, the widget is subscribed and will update on
  /// all changes whenever the [ReactiveController.setState] method is called.
  static ReactiveController<T> getReactive<T>(BuildContext context,
          {bool subscribe = false,}) =>
      getInjectable<T>(context, subscribe: subscribe).stateSingleton;

  static Injectable<T> getRootInjectable<T>() {
    final states = _InheritedState._rootState!._states;
    final injectable = states.cast<Injectable<dynamic>?>().firstWhere(
        (injectable) => injectable!.type == T,
        orElse: () => null,) as Injectable<T>?;
    if (injectable == null) {
      throw Exception('${T.toString()} is not registered.');
    }

    return injectable;
  }

  static Injectable<T> getInjectable<T>(BuildContext context,
      {bool subscribe = false,}) {
    final inject = Inject.staticOf<T>(context, subscribe);
    if (inject == null) throw Exception('${T.toString()} is not registered.');

    return inject.injectable;
  }

  /// Provides a way to access a pre-registered reactive instance of type [T].
  /// [context] must be provided so the widget is subscribed and will update on
  /// all changes whenever the [ReactiveController.setState] method is called.
  // ignore: avoid_positional_boolean_parameters
  static T get<T>(BuildContext context, [bool subscribe = true]) =>
      getInjectable<T>(context, subscribe: subscribe).singleton;

  /// Provides a shortcut for updating state of type [T].
  /// This update can be mutable or immutable depending on if the setter [call] method
  /// returns the same type as [T].
  ///
  /// This calls the underlying [ReactiveController.setState] method to update the state.
  static T set<T>(BuildContext context, [dynamic Function(T)? call]) {
    final value = RS.getReactive<T>(context);
    value.setState(call);

    return value.state;
  }
}

/// [InheritedState] is used to register reactive and immutable state functions that
/// can be used by the descendant widgets.
class InheritedState extends StatefulWidget {
  /// [InheritedState] is used to register reactive and immutable state functions that
  /// can be used by the descendant widgets.
  ///
  /// [states] accepts a list of [Inject]s that essentially
  /// register an instance creation function to be used when a state type is requested.
  const InheritedState({
    Key? key,
    required this.states,
    required this.builder,
  }) : super(key: key);

  final List<Injectable> states;
  final Widget Function(BuildContext) builder;

  static void replaceReactive<T>(Injectable<T> injectable, T state) {
    injectable.disposeSingleton();
    injectable.singleton = state;
  }

  @override
  State<InheritedState> createState() => _InheritedState();
}

class _InheritedState extends State<InheritedState> {
  final _states = <Injectable>[];
  static _InheritedState? _rootState;

  @override
  void initState() {
    super.initState();
    _initStates(widget.states, _states);
    _rootState ??= this;
  }

  static void _initStates(
      List<Injectable> widgetInjectables, List<Injectable> localInjectables,) {
    localInjectables.addAll(widgetInjectables);
  }

  @override
  void dispose() {
    _disposeStates(_states);

    super.dispose();
  }

  static void _disposeStates(List<Injectable> injectables) {
    for (final injectable in injectables) {
      injectable.disposeSingleton();
    }
    injectables.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = Builder(
      builder: (BuildContext context) {
        return widget.builder(context);
      },
    );

    return _states.reversed.fold(
      child,
      (child, inject) => inject.inheritedInject(child),
    );
  }
}

extension BuildContextEventExtension on BuildContext {
  T on<T>() => ReactiveState.get<T>(this);
  T once<T>() => ReactiveState.get<T>(this, false);
  T dispatch<T>([dynamic Function(T)? call]) =>
      ReactiveState.set<T>(this, call);
}
