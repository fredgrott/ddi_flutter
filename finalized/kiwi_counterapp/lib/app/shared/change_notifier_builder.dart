// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Crizant Lai under MIT License. Modifications 
// by Fredrick Allan Grott and under BSD License

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// A widget whose content stays synced with a ChangeNotifier.
/// Given a `notifier` of a subclass of ChangeNotifier
/// and a `builder` which builds widgets from properties of `notifier`,
/// this class will automatically register itself as a listener of the ChangeNotifier
/// and calls the `builder` method when the ChangeNotifier updates.
class ChangeNotifierBuilder<T extends ChangeNotifier> extends AnimatedWidget {
  ChangeNotifierBuilder({
    Key? key,
    required this.notifier,
    required this.builder,
    this.child,
  }) : super(key: key, listenable: notifier ?? ChangeNotifier());

  final T? notifier;
  final Widget Function(
    BuildContext context,
    T? notifier,
    Widget? child,
  ) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return builder(context, notifier, child);
  }
}

class MultiChangeNotifierBuilder extends StatefulWidget {
  const MultiChangeNotifierBuilder({
    Key? key,
    required this.notifiers,
    required this.builder,
    this.child,
  }) : super(key: key);

  final List<Listenable?> notifiers;

  final Widget Function(
    BuildContext context,
    Widget? child,
  ) builder;

  final Widget? child;

  @override
  _MultiChangeNotifierBuilderState createState() =>
      _MultiChangeNotifierBuilderState();
}

class _MultiChangeNotifierBuilderState
    extends State<MultiChangeNotifierBuilder> {
  final Set<Listenable> _listenedNotifiers = {};

  @override
  void initState() {
    super.initState();
    for (final notifier in widget.notifiers) {
      if (notifier != null) {
        notifier.addListener(_handleChange);
        _listenedNotifiers.add(notifier);
      }
    }
  }

  @override
  void didUpdateWidget(MultiChangeNotifierBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    // store outdated items temporarily,
    // to avoid `Concurrent modification during iteration` error
    final Set<Listenable> itemsToRemove = {};
    for (final notifier in _listenedNotifiers) {
      // remove old notifiers
      if (!widget.notifiers.contains(notifier)) {
        notifier.removeListener(_handleChange);
        itemsToRemove.add(notifier);
      }
    }
    // remove all outdated items
    _listenedNotifiers.removeAll(itemsToRemove);
    for (final notifier in widget.notifiers) {
      if (notifier != null && !_listenedNotifiers.contains(notifier)) {
        notifier.addListener(_handleChange);
        _listenedNotifiers.add(notifier);
      }
    }
  }

  @override
  void dispose() {
    for (final notifier in _listenedNotifiers) {
      notifier.removeListener(_handleChange);
    }
    super.dispose();
  }

  void _handleChange() {
    // ignore: no-empty-block
    setState(() {
      // The listenable's state is our build state, and it changed already.
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.child);
  }
}
