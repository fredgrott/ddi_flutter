// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inherited_bloc/app/bizlogic_controllers/countblocprovider.dart';
import 'package:inherited_bloc/app/bizlogic_controllers/counterbloc.dart';
import 'package:inherited_bloc/app/domain/models/mycounter.dart';
import 'package:inherited_bloc/app/shared/app_vars.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final myCounter = MyCounter(0);
    final CounterBloc bloc = CounterBloc();
    
    return CountBlocProvider(
      bloc: bloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              appTitle,
            ),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<int>(
      stream: bloc.itemCount,
      initialData: 0,
      builder: (context, snapshot) => Text(
            "Count : ${snapshot.data}",
            style: Theme.of(context).textTheme.headline5,
          ),
    ),
             
            ],
          ),),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              bloc.add.add(myCounter);
            },
          ),),
    );
  }
}
