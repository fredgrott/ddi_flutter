
import 'package:flutter/widgets.dart';
import 'package:fluttercommands_benchmark/app/myapp.dart';



// This works as the main function in say main_dev.dart 
// redirects to this mainDelegate() function and 
// thus dart is able to pick this up via the cmd-line
// compile(run) -t main_dev.dart
void mainDelegate() => runApp(MyApp());


