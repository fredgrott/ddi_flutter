// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under 
// MIT license and modifications under BSD license.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_two/app/shared/my_portal.dart';
import 'package:overlay_two/app/widgets/barrier.dart';

class Modal extends StatelessWidget {
  const Modal({
    Key? key,
    required this.visible,
    required this.onClose,
    required this.modal,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Widget modal;
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
        portal: TweenAnimationBuilder<double>(
          duration: kThemeAnimationDuration,
          curve: Curves.easeOut,
          tween: Tween(begin: 0, end: visible ? 1 : 0),
          builder: (context, progress, child) {
            return Transform(
              transform: Matrix4.translationValues(0, (1 - progress) * 50, 0),
              child: Opacity(
                opacity: progress,
                child: child,
              ),
            );
          },
          child: Center(child: modal),
        ),
        child: child,
      ),
    );
  }
}
