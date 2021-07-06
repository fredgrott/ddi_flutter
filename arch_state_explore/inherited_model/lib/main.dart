import 'package:flutter/material.dart';
import 'package:inherited_model/app/myapp.dart';
import 'package:inherited_model/app/screens/numbermanager.dart';

void main() => runApp(NumberManagerWidget(updateMs: 1000, key: const Key('number'),
child: MyApp(),));

