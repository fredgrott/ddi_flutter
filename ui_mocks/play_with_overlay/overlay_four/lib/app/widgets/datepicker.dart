// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under
// MIT license and modifications under BSD license.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_four/app/shared/my_portal.dart';

class DeclarativeDatePicker extends StatelessWidget {
  const DeclarativeDatePicker({
    Key? key,
    required this.visible,
    required this.onDismissed,
    required this.onClose,
    required this.child,
  }) : super(key: key);

  final bool visible;
  final Widget child;
  final VoidCallback onDismissed;
  final void Function(DateTime date) onClose;

  @override
  Widget build(BuildContext context) {
    return PortalEntry(
      visible: visible,
      portal: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(
              child: ModalBarrier(color: Colors.black38),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onDismissed,
            child: Center(
              child: Card(
                elevation: 16,
                child: ElevatedButton(
                  onPressed: () => onClose(DateTime.now()),
                  child: const Text('today'),
                ),
              ),
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
