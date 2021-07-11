// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under
// MIT license and modifications under BSD license.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_one/app/shared/my_portal.dart';
import 'package:overlay_one/app/widgets/barrier.dart';
import 'package:overlay_one/app/widgets/hole_painter.dart';

class Discovery extends StatelessWidget {
  const Discovery({
    Key? key,
    required this.visible,
    required this.onClose,
    required this.description,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Widget description;
  final bool visible;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Barrier(
      visible: visible,
      onClose: onClose,
      child: PortalEntry(
        visible: visible,
        closeDuration: kThemeAnimationDuration,
        portalAnchor: Alignment.center,
        childAnchor: Alignment.center,
        portal: Stack(
          children: [
            CustomPaint(
              // ignore: deprecated_member_use
              painter: HolePainter(Theme.of(context).accentColor),
              child: TweenAnimationBuilder<double>(
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
                tween: Tween(begin: 50, end: visible ? 200 : 50),
                builder: (context, radius, _) {
                  return Padding(
                    padding: EdgeInsets.all(radius),
                    child: child,
                  );
                },
              ),
            ),
            Positioned(
              top: 100,
              left: 50,
              width: 200,
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.headline5!,
                child: TweenAnimationBuilder<double>(
                  duration: kThemeAnimationDuration,
                  curve: Curves.easeOut,
                  tween: Tween(begin: 0, end: visible ? 1 : 0),
                  builder: (context, opacity, _) {
                    return Opacity(
                      opacity: opacity,
                      child: description,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
