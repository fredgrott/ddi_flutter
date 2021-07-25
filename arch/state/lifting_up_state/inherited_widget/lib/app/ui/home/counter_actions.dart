// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:inherited_widget/app/domain/binders/counter_update.dart';
import 'package:inherited_widget/app/domain/binders/model.dart';
import 'package:inherited_widget/app/domain/models/counter_model.dart';
import 'package:inherited_widget/app/ui/themes/my_cupertino_iconbutton_data.dart';
import 'package:inherited_widget/app/ui/themes/my_material_iconbutton_data.dart';

class CounterActions extends StatelessWidget {
  const CounterActions({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Model.of<CounterModel>(context);
    
    return PlatformIconButton(
      onPressed: () => CounterUpdate(model!.counter + 1)..dispatch(context),
      icon: Icon(context.platformIcons.addCircledSolid),
      key: const Key('increment'),
      material: (_, __) => myMaterialIconButtonData,
      cupertino: (_, __) => myCupertinoIconButtonData,
    );
  }
}
