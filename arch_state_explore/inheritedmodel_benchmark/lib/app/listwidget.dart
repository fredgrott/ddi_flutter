// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inheritedmodel_benchmark/app/page.dart';



class ListViewWidget extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return ListView.builder(
         padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
         itemCount: items.length,
         itemBuilder: (context, index) {
           
           return ListTile(
             title: Text((items[index].id).toString()),
           );
         },);
   }
 }
