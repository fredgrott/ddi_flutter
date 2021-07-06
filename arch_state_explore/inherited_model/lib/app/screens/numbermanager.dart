// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:inherited_model/app/screens/numbermodel.dart';

class NumberManagerWidget extends StatefulWidget {
  final int updateMs;
  final Widget child;

  const NumberManagerWidget({required Key key, required this.child, required this.updateMs})
      : assert(updateMs > 0),
        assert(child != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => NumberManagerWidgetState();
}

class NumberManagerWidgetState extends State<NumberManagerWidget> {
  late Timer updateTimer;
  late int firstTick, secondTick, thirdTick;

  @override
  void initState() {
    super.initState();
    firstTick = secondTick = thirdTick = 0;
    resetTimer();
  }

  @override
  void didUpdateWidget(NumberManagerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    resetTimer();
  }

  void resetTimer() {
    updateTimer.cancel();
    updateTimer = Timer.periodic(
      Duration(milliseconds: widget.updateMs),
      (Timer t) {
        setState(() {
          firstTick++;
          if (firstTick % 2 == 0) {
            secondTick++;
            if (secondTick % 2 == 0) {
              thirdTick++;
            }
          }
        });
      },
    );
  }

  @override
  void dispose() {
    updateTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NumberModel(
      firstValue: firstTick,
      secondValue: secondTick,
      thirdValue: thirdTick,
      child: widget.child,
    );
  }
}
