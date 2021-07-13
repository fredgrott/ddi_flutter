// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:setstate_benchmark/app/listwidget.dart';
import 'package:setstate_benchmark/app/shared/item.dart';


class MyPage extends StatefulWidget {
   const MyPage({
     required Key key,
     required this.title,
   }) : super(key: key);

   final String title;

   @override
   _MyPageState createState() => _MyPageState();
 }

 final items = List<Item>.of(list);

 class _MyPageState extends State<MyPage> {
   @override
   void initState() {
     super.initState();
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text("Idle"),
       ),
       body: ListViewWidget(),
     );
   }
 }
