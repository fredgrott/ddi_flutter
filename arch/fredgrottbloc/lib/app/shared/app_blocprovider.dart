// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original was bloc_provider by Roberto Huertas under MIT License.
// My Modifications under BSD License.

import 'package:flutter/widgets.dart';
import 'package:fredgrottbloc/app/shared/app_ibloc.dart';

typedef UpdateShouldNotify<T> = bool Function(
    T bloc, InheritedWidgetBlocProvider oldWidget,);

/// The `BlocProvider` class depends on `InheritedWidget`.
/// It accepts a bloc and a widget.
class BlocProvider<T extends IBloc> extends StatefulWidget {
  /// The  BLoC this provider will be hosting
  final T bloc;

  /// The widget that the [BlocProvider] will wrap
  final Widget child;

  /// Allows you to override the default update policy
  ///
  /// Default implementation:
  ///
  /// ```dart
  ///    @override
  ///    bool updateShouldNotify(InheritedWidgetBlocProvider oldWidget) =>
  ///       updateShouldNotifyOverride != null
  ///           ? updateShouldNotifyOverride(bloc, oldWidget)
  ///           : oldWidget.bloc != bloc;
  /// ```
  late final UpdateShouldNotify<T> updateShouldNotifyOverride;

  

  /// Builds a [BlocProvider].
  ///
  /// [child] is the widget that the [BlocProvider] will wrap.
  /// [bloc] is the BLoC this provider will be hosting.
  /// [updateShouldNotifiyOverride] is an optional parameter that will allow you
  /// to override the default behavior.
  /// This is the default implementation of the `updateShouldNotify` method:
  ///
  /// ```dart
  ///    @override
  ///    bool updateShouldNotify(InheritedWidgetBlocProvider oldWidget) =>
  ///       updateShouldNotifyOverride != null
  ///           ? updateShouldNotifyOverride(bloc, oldWidget)
  ///           : oldWidget.bloc != bloc;
  /// ```
  BlocProvider({
    required Key key,
    required this.child,
    required this.bloc,
    required this.updateShouldNotifyOverride,
  }) : super(key: key);

  /// Whenever you want to get your `BloC`, you can decide wether to attach the context of your widget to the `InheritedWidget` or not.
  /// In order to control this behavior, the static method `of` has an optional boolean argument (which is true by default) which determines wether your context will be attached or not.
  /// Basically, if you don't provide it or you just set it to `true`, [dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html) will be used.
  /// If you set it to `false` then [getElementForInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/getElementForInheritedWidgetOfExactType.html) will be used instead.
  static T of<T extends IBloc>(
    BuildContext context,
    // ignore: avoid_positional_boolean_parameters
    [
    bool attachContext = true,
  ]) =>
      InheritedWidgetBlocProvider.of(context, attachContext);

  /// Creates the state
  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T extends IBloc> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return InheritedWidgetBlocProvider(
      bloc: widget.bloc,
      updateShouldNotifyOverride: widget.updateShouldNotifyOverride,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class InheritedWidgetBlocProvider<T extends IBloc> extends InheritedWidget {
  final T bloc;
  @override
  final Widget child;
  final UpdateShouldNotify<T> updateShouldNotifyOverride;

  const InheritedWidgetBlocProvider({
    required this.bloc,
    required this.child,
    required this.updateShouldNotifyOverride,
  }) : super(child: child);

  // ignore: avoid_positional_boolean_parameters
  static T of<T extends IBloc>(BuildContext context, bool attachContext) {
    late InheritedWidgetBlocProvider<T> blocProvider;

    if (attachContext) {
      blocProvider = context.dependOnInheritedWidgetOfExactType<
          InheritedWidgetBlocProvider<T>>()!;
    } else {
      final element = context.getElementForInheritedWidgetOfExactType<
          InheritedWidgetBlocProvider<T>>();
      if (element != null) {
        blocProvider = element.widget as InheritedWidgetBlocProvider<T>;
      }
    }

    // ignore: unnecessary_null_comparison
    if (blocProvider == null) {
      final type = _typeOf<InheritedWidgetBlocProvider<T>>();
      throw FlutterError('Unable to find BLoC of type $type.\n'
          'Context provided: $context');
    }

    return blocProvider.bloc;
  }

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(InheritedWidgetBlocProvider oldWidget) =>
      // ignore: unnecessary_null_comparison
      updateShouldNotifyOverride != null
          ? updateShouldNotifyOverride(bloc, oldWidget)
          : oldWidget.bloc != bloc;
}
