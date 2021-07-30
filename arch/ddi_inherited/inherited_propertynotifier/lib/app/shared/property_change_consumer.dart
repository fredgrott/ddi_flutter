// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from property_change_notifier

import 'package:flutter/widgets.dart';
import 'package:inherited_propertynotifier/app/shared/property_change_notifier.dart';
import 'package:inherited_propertynotifier/app/shared/property_change_provider.dart';

typedef PropertyChangeBuilder<T, S> = Widget Function(
    BuildContext, T?, Set<S>?,);

/// A widget-based listener for cases where a [BuildContext] is hard to access, or if you prefer this kind of API.
/// To register the widget to be rebuilt only on specific property changes, provide a [properties] parameter.
/// The type parameter [T] is the type of the [PropertyChangeNotifier] subclass.
/// The type parameter [S] is the type of the properties to observe.
///
/// Access both the model value and the changed properties via the [builder] callback:
/// ```dart
/// PropertyChangeConsumer<MyModel, String>(
///    properties: ['foo', 'bar'],
///    builder: (context, model, properties) {
///      return Column(
///        children: [
///          Text('$properties were changed!'),
///          RaisedButton(
///            child: Text('Update foo'),
///            onPressed: () {
///              model.foo = DateTime.now().toString();
///            },
///          ),
///          RaisedButton(
///            child: Text('Update bar'),
///            onPressed: () {
///              model.bar = DateTime.now().toString();
///            },
///          ),
///        ],
///      );
///    },
///  );
///
/// See also:
///
///  * [StringPropertyChangeConsumer], where the second generic type can be omitted
///    for models that extend PropertyChangeNotifier<String>.
///
/// ```
class PropertyChangeConsumer<T extends PropertyChangeNotifier<S>,
    S extends Object> extends StatelessWidget {
  final Iterable<S>? properties;
  final PropertyChangeBuilder<T, S> builder;

  const PropertyChangeConsumer({
    Key? key,
    this.properties,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = PropertyChangeProvider.of<T, S>(context,
        properties: properties, listen: true,);
        
    return builder(context, model?.value, model?.properties);
  }
}
