// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Flutter Portal code, original under
// MIT license and modifications under BSD license.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:overlay_four/app/widgets/datepicker.dart';

class DatePickerUsageExample extends StatefulWidget {
  const DatePickerUsageExample({Key? key}) : super(key: key);

  @override
  _DatePickerUsageExampleState createState() => _DatePickerUsageExampleState();
}

class _DatePickerUsageExampleState extends State<DatePickerUsageExample> {
  DateTime? pickedDate;
  bool showDatePicker = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DeclarativeDatePicker(
        visible: showDatePicker,
        onClose: (date) => setState(() {
          showDatePicker = false;
          pickedDate = date;
        }),
        onDismissed: () => setState(() => showDatePicker = false),
        child: pickedDate == null
            ? ElevatedButton(
                onPressed: () => setState(() => showDatePicker = true),
                child: const Text('pick a date'),
              )
            : Text('The date picked: $pickedDate'),
      ),
    );
  }
}
