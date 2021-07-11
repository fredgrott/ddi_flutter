// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under
// MIT license and modifications under BSD license.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_five/app/widgets/menu.dart';
import 'package:overlay_five/app/widgets/modal_entry.dart';

class ContextualMenuExample extends StatefulWidget {
  const ContextualMenuExample({Key? key}) : super(key: key);

  @override
  _ContextualMenuExampleState createState() => _ContextualMenuExampleState();
}

class _ContextualMenuExampleState extends State<ContextualMenuExample> {
  bool _showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ModalEntry(
        visible: _showMenu,
        onClose: () => setState(() => _showMenu = false),
        childAnchor: Alignment.topRight,
        menuAnchor: Alignment.topLeft,
        menu: const Menu(
          children: [
            PopupMenuItem<void>(
              height: 42,
              child: Text('first'),
            ),
            PopupMenuItem<void>(
              height: 42,
              child: Text('second'),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () => setState(() => _showMenu = true),
          child: const Text('show menu'),
        ),
      ),
    );
  }
}
