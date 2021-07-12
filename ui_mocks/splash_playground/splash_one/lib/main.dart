import 'package:build_variants/app/myapp.dart';
import 'package:flutter/widgets.dart';


// This works as the main function in say main_dev.dart 
// redirects to this mainDelegate() function and 
// thus dart is able to pick this up via the cmd-line
// compile(run) -t main_dev.dart
void mainDelegate() => runApp(const MyApp());


